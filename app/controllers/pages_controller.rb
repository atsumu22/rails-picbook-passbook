require "open-uri"
require "nokogiri"

class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
  end

  def search
  end

  def query
    @books = Book.all
  end

  def barcode
    # @scrape_result = scrape_barcode_result
  end

  def logsedit
    @user = current_user
    @logs = policy_scope(Log).where(user: @user)
  end

  private

  def scrape_barcode_result
    url = "http://localhost:3000/barcode"
    html_content = URI.open(url).read
    doc = Nokogiri::HTML.parse(html_content)
    return doc
  end
end
