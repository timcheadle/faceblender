#!/usr/bin/env ruby

require 'rubygems'
require 'json'
require 'open-uri'
require 'RMagick'
require 'tmpdir'


IMAGE_WIDTH = 1400
IMAGE_HEIGHT = 500

API_URL = 'http://uifaces.com/api/v1/random'


num_across = IMAGE_WIDTH  / 128
num_down   = IMAGE_HEIGHT / 128
num_total  = num_across * num_down

image_files = []


# Download images
dir = Dir.mktmpdir

(1..num_total).each do |i|
  images = JSON.parse( open(API_URL).read )

  username  = images['username']
  image_url = images['image_urls']['epic']

  File.open("#{dir}/#{username}.jpg", 'w') do |file|
    puts "#{image_url} --> #{dir}/#{username}.jpg"
    file.write open(image_url).read

    image_files << file.path
  end
end

# Create the montage
orig = Magick::ImageList.new(*image_files)

faceblend_image = orig.montage() {
  self.border_width = 0
  self.geometry = '+0+0'
  self.tile = "#{num_across}x#{num_down}"
}
faceblend_image.write "output.jpg"
