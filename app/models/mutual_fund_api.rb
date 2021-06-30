# frozen_string_literal: true

class MutualFundApi
  include HTTParty

  def initialize(product_code)
    @product_code = product_code
  end

  def response
    base_url = 'https://web.scraper.workers.dev/?'
    yahoo_url = "url=https%3A%2F%2Fin.finance.yahoo.com%2Fquote%2F#{@product_code}%3Fp%3D#{@product_code}"
    suffix = '&selector=span&scrape=text'

    self.class.get("#{base_url}#{yahoo_url}#{suffix}").body
  end

  def response_as_json
    JSON.parse(response)
  end

  def price
    spans = response_as_json['result']['span']
    closing_price_span = spans.find_index('Previous close')
    price_span = spans[closing_price_span + 1]
    money = Monetize.parse("INR #{price_span}")
    (money&.cents * 1.0) / 100
  end
end
