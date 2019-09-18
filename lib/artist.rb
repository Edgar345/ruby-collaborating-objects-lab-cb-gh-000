class Artist
  attr_accessor :name
  @@all = []

  def initialize name
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def songs
    Song.all.select {|song| song.artist == self}
  end

  def add_song song
    #creates a relationship
    # song belongs to an artist
    song.artist = self
  end

  def print_songs
    self.songs.each {|song| puts song.name }
  end

  def self.find_or_create_by_name name
    artist = self.all.find {|artist| artist.name == name}

    if artist.nil?
      artist = self.new name
    end
    artist
  end
end
