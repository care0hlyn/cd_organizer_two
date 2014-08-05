require 'rspec'
require 'artists'
require 'albums'

describe Artists do
  it 'initializes the name of the artist' do
    test_artist = Artists.new({:artist => "Paul McCartney"})
    test_artist.should be_an_instance_of Artists
  end

end
