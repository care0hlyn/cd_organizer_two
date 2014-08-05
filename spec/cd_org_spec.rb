require 'rspec'
require 'artists'
require 'albums'

describe Artists do
  it 'initializes the name of the artist with an empty album array' do
    test_artist = Artists.new({:name => "Paul McCartney", :album => []})
    test_artist.should be_an_instance_of Artists
  end

  it 'shows the name of the artist' do
    test_artist = Artists.new({:name => "Paul McCartney"})
    expect(test_artist.name).to eq "Paul McCartney"
  end

end
