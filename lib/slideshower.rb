require 'rubygems'
require "json"

class Slideshower
  def self.make_it
    images = []

    Dir.open(Dir.pwd).each do |file|
      next if file =~ /^\./ || file =~ /index.json/ || File.directory?(File.join(Dir.pwd,file))
      images << file if file =~ /\.jpg|jpeg|gif|png$/
    end

    File.new(File.join(Dir.pwd, "index.json"), 'w+').puts images.to_json

    puts "\n#{images.size} images were dumped to json. Upload this directory to a web accessible place and pass out the url to the directory.\n"

  end
end

