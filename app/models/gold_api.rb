# frozen_string_literal: true

class GoldApi
  include HTTParty

  def response
    self.class.get('https://web.scraper.workers.dev/?url=https%3A%2F%2Fwww.goodreturns.in%2Fgold-rates%2F&selector=.metal-main-section+strong&scrape=text&pretty=true').body
  end

  def response_as_json
    JSON.parse(response)
  end

  def price
    price_string_with_icon = response_as_json['result']['.metal-main-section strong'][0]
    price_string = price_string_with_icon.gsub('&#8377; ', '')
    money = Monetize.parse("INR #{price_string}")
    money&.dollars&.round
  end
end
