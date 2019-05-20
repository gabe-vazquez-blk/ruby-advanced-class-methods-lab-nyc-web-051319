require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  #def initialize
  #  @name = name
  #  @artist_name = artist_name
  #end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    new_song = Song.new
    self.all << new_song
    new_song
  end

  def self.new_by_name(name)
    new_song = Song.new
    #@@all << new_song
    new_song.name = name
    new_song
  end

  def self.create_by_name(name)
    new_song = Song.new
    new_song.name = name
    self.all << new_song
    new_song
  end

  def self.find_by_name(name)
    self.all.find do |song|
      song.name == name
    end
  end

  def self.find_or_create_by_name(name)
    if find_by_name(name)
      find_by_name(name)
    else
      create_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort_by do |song|
      song.name
    end
  end

  def self.new_from_filename(file)
    song_data = file.split(/[-.]/)
    new_song = self.new
    new_song.artist_name = song_data[0].strip
    new_song.name = song_data[1].strip
    new_song
  end

  def self.create_from_filename(file)
    self.all << self.new_from_filename(file)
  end

  def self.destroy_all
    self.all.clear
  end

end
