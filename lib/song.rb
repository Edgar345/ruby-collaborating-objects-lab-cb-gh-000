class Song
  attr_accessor :name, :artist
  @@all = []

  def initialize name
    @name = name
    @@all << self
  end

  def artist_name= name
    artist = Artist.find_or_create_by_name name
    artist.add_song self
    artist
  end

  def self.all
    @@all
  end

  def self.new_by_filename file
    song_array = file.split("-")
    song_name = song_array[1].lstrip.rstrip
    artist_name = song_array[0].rstrip

    song = self.new song_name
    artist = Artist.find_or_create_by_name(artist_name)
    artist.add_song(song)
    song
  end
end
