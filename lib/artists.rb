class Artist
  attr_reader :name, :albums
  @@artists = []

  def initialize (artist_name)
    @name = artist_name[:name]
    @albums = []
  end

  def Artist.all
    @@artists
  end

  def add_album(album)
    @albums << album
  end

  def save
    @@artists << self
  end
end
