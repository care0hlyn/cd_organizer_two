class Album
  attr_reader :title
    @@album = []

  def initialize(title)
    @title = title
  end

  def Album.all
    @@album.sort_by! { |album| album.title.capitalize }
  end

  def save
    @@album << self
  end

end
