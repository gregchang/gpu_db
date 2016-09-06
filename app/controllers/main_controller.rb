require './lib/scraper.rb'

class MainController < ApplicationController
  def home
    #Start Sapphire web scraper
    scraper = Scraper.new
    scraper.main
  end
end
