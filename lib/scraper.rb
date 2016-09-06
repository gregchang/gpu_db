class Scraper
  require 'mechanize'
  require 'json'
  require 'date'

  def main

    puts 'scraper'
    count=1

    db_row_count = Product.count(:name)
    puts "aloha"
    
    # con = PG.connect :dbname => 'postgres', :user => 'postgres',
    #                  :password => 'dbpassqwerty'
    # db = SQLite3::Database.open 'db/development.sqlite3'
    # con.exec "DROP TABLE IF EXISTS specs"
    # con.exec "CREATE TABLE IF NOT EXISTS
    # specs(Id INTEGER PRIMARY KEY, designer TEXT, model TEXT, name TEXT, part TEXT, boostClock INTEGER, baseClock INTEGER, memClock INTEGER, vram INTEGER, length REAL, width REAL, height REAL, backplate INTEGER, warranty INTEGER, msrp INTEGER, manurl TEXT, power TEXT, ports INTEGER, ports_detailed TEXT, cooling TEXT, imgurl TEXT)"

    # db_row_count = (con.exec "SELECT COUNT(*) FROM specs")[0]["count"].to_i
    puts db_row_count
    return

    if db_row_count > 0
      puts "Database not empty"
      return
    end

    @data = Array.new

    agent = Mechanize.new

    catalog_page = agent.get("http://www.sapphiretech.com/catapage_select.asp?lang=eng")

    #catalog_link = catalog_page.link_with(:text => 'R9 390X')

    catalog_links = catalog_page.links_with(text: %r{^.*RX.*$})
    catalog_links += catalog_page.links_with(text: %r{^.*R9.*$})
    catalog_links += catalog_page.links_with(text: %r{^.*R7.*$})

    # catalog_links = catalog_links[67]

    for catalog_link in catalog_links


      catalog_page = catalog_link.click

      #puts catalog_page.uri

      gpu_page = agent.get(catalog_page.uri)

      gpu_links = gpu_page.links_with(text: %r{^.*RX.*$}, href: %r{^.*productdet.*$})
      gpu_links += gpu_page.links_with(text: %r{^.*R9.*$}, href: %r{^.*productdet.*$})
      gpu_links += gpu_page.links_with(text: %r{^.*R7.*$}, href: %r{^.*productdet.*$})

      models = gpu_links.map do |link|
        model = link.click
        model_name_meta = model.search('.product-title')
        model_name = model_name_meta.search('h3')[0].text
        model_gpu = model.at('tr:contains("GPU")').text.strip
        model_dimensions = model.at('tr:contains("Form Factor")').text.strip

        imgurl = model.at('.product-image-left img')['src']
        puts imgurl

        #length > width > height

        designer_value = 'N/A'
        model = ''
        name = ''
        part = ''
        boost_clock = -1
        length = -1
        width = -1
        height = -1
        backplate = 0

        # puts model_name.downcase

        #Designer
        if model_name.downcase.include?('radeon') || model_name.downcase.include?('r9') || model_name.downcase.include?('r7') || model_name.downcase.include?('rx')
          designer_value = 'AMD'
        elsif model_name.include? 'GTX'
          designer_value = 'Nvidia'
        end


        #Ensure consistency of all-caps SAPPHIRE in name
        if model_name.include? "Sapphire"
          model_name = model_name[9...model_name.length]
        end

        if designer_value == 'AMD'
          unless model_name.downcase.include? 'sapphire'
            model_name = 'SAPPHIRE ' + model_name
          end
        end

        #Backplate
        if model_name.downcase.include? 'backplate' or model_name.include? 'back plate' or model_name.include? 'Back Plate'
          backplate = 1
          puts 'aargh'
        end
        puts model_dimensions
        model_dimensions = model_dimensions[/Occupied(.*?)mm/]


        if model_dimensions != nil and model_dimensions.include? 'Occupied'
          puts 'has Occupied '
        end

        model_dimensions_original = model_dimensions

        #type 1 dimension data
        if model_dimensions != nil and model_dimensions.include? 'Inch' and model_dimensions.include? '(L)' and model_dimensions.include? 'Occupied'
          model_dimensions = model_dimensions[/Inch(.*?)Dimension/]

          if model_dimensions.nil?
            puts "model_dimensions type 1 null after initial check"
            break
          end
          model_dimensions.gsub! 'Inch', ''
          model_dimensions.gsub! ' Dimension', ''
          model_dimensions.gsub! ' ', ''

          model_dimensions_array = model_dimensions.split('X')
          if model_dimensions_array.length == 1
            model_dimensions_array = model_dimensions.split('x')
          end

          if model_dimensions_array.length == 3

            length = model_dimensions_array[0].gsub! '(L)', ''
            width = model_dimensions_array[1].gsub! '(W)', ''
            height = model_dimensions_array[2].gsub! '(H)', ''
          end

        end

        #type 2 dimension data
        if model_dimensions != nil and model_dimensions.include? 'Inch' and model_dimensions.include? 'mm' and model_dimensions.include? 'Occupied'
          model_dimensions = model_dimensions[/Inch(.*?)Dimension/]
          model_dimensions.gsub! 'Inch', ''
          model_dimensions.gsub! ' Dimension', ''
          model_dimensions.gsub! ' ', ''

          model_dimensions_array = model_dimensions.split('x')
          if model_dimensions_array.length == 1
            model_dimensions_array = model_dimensions.split('X')
          end

          if model_dimensions_array.length == 3

            length = model_dimensions_array[0]
            width = model_dimensions_array[1]
            height = model_dimensions_array[2]
          end
        end

        #type 3 dimension data
        if model_dimensions != nil and model_dimensions.include? '(L)' and model_dimensions.include? 'mm' and model_dimensions.include? 'Occupied'
          model_dimensions = model_dimensions[/Occupied(.*?)Dimension/]

          if model_dimensions.nil?
            puts "model_dimensions type 3 null after initial check"
            break
          end

          model_dimensions.gsub! 'Occupied', ''
          model_dimensions.gsub! ' Dimension', ''
          model_dimensions.gsub! ' ', ''

          model_dimensions_array = model_dimensions.split('X')

          if model_dimensions_array.length == 3
            length = model_dimensions_array[0].gsub! '(L)', ''
            width = model_dimensions_array[1].gsub! '(W)', ''
            height = model_dimensions_array[2].gsub! '(H)', ''
          end
        end

        if model_dimensions != nil
          puts 'length here ' + length.to_s
        else
          puts 'length is nil'
        end
        #puts 'backplate ' + backplate.to_s
        #puts 'modelname ' + model_name



        # con.exec "INSERT INTO specs VALUES ("+count.to_s+", '"+designer_value.to_s+"', null, '"+model_name.to_s+"', null, null, null, null, null, '"+length.to_s+"', '"+width.to_s+"', '"+height.to_s+"', '"+backplate.to_s+"', null, null, null, null, null, '"+model_dimensions_original.to_s+"', null, '"+imgurl.to_s+"');"

        object = Product.create(designer: designer_value, model: nil, name: model_name, part: nil, boostClock: nil, baseClock: nil, memClock: nil, vram: nil, length: length, width: width, height: height, backplate: backplate, warranty: nil, msrp: nil, manurl: nil, power: nil, ports: nil, ports_detailed: model_dimensions_original, cooling: nil, imgurl: imgurl)

        count += 1
        puts count

        @data.push(model_name)
        @data.push(model_gpu)
        @data.push(model_dimensions)
      end
    end
    #puts gpu_links

    # gpu_page.links.each do |link|
    #   puts link.text
    # end


    puts 'scraper finished'

  end

  attr_reader :data

end
