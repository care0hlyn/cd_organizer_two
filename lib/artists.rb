class Artist
  attr_reader :name
  @@artists = []

  def initialize (artist_name)
    @name = artist_name[:name]
    @albums = []
  end

  def Artist.all
    @@artists
  end

  def save
    @@artists << self
  end
end
