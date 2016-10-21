require './lib/scraper.rb'

class MainController < ApplicationController
  def home
  end

  def cp

  end

  def sapphire_scrape
    #Start Sapphire web scraper
    puts "Running Sapphire scraper"
    scraper = Scraper.new
    scraper.main
  end

  # def show
  #   render js: "alert('The number is: #{params[:id]}')"
  # end
end
