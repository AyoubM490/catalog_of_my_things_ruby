require 'json_handler'
require './classes/music_album'
require 'fileutils'

class DataStorage
  def initialize(file_name)
    @file_name = file_name
  end

  def read_data
    File.exist?(@file_name) ? JsonHandler.parse_json(File.read(@file_name)) : []
  end

  def write_data(data)
    File.write(@file_name, JsonHandler.generate_json(data))
  end

  def objects_to_hash_array(array_of_objects)
    puts array_of_objects.map(&:to_hash)
  end

  def objects_from_array(array_of_hashes)
    array_of_hashes.map do |hash|
      MusicAlbum.create_from_hash(hash)
    end
  end
end
