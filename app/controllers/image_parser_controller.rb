require 'faraday'
require 'open-uri'
require 'nokogiri'
require 'net/http'

class ImageParserController < ApplicationController
  def parse_images
  end

  def parse_images_perform
    ids_from = params["id_from"].to_i
    ids_to = params["id_to"].to_i
    return true if ids_from >= ids_to
    return true if (ids_to - ids_from) >= 50

    valid_hosts = ["i.imgur.com"]
    @urls = []
    for i in (ids_from..ids_to)
      doc = Nokogiri::HTML(URI.open("https://prnt.sc/#{i.to_s}"))
      url = doc.xpath("//img[@id='screenshot-image']")[0].values[1]
      next unless URI.parse(url).host.present?
      next unless valid_hosts.include? URI.parse(url).host

      @urls << url
    end

    render "parse_images"
  end
end
