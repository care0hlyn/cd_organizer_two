class Album
  attr_reader :title
    @@album = []

  def initialize(title)
    @title = title
  end

  def Album.all
    @@album
  end

  def save
    @@album << self
  end

end
