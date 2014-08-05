require 'rspec'
require 'artists'
require 'albums'

describe Artist do
  it 'initializes the name of the artist with an empty album array' do
    test_artist = Artist.new({:name => "Paul McCartney"})
    test_artist.should be_an_instance_of Artist
  end

  it 'shows the name of the artist' do
    test_artist = Artist.new({:name => "Paul McCartney"})
    expect(test_artist.name).to eq "Paul McCartney"
  end

  it 'saves new artist to list' do
    test_artist = Artist.new({:name => "Paul McCartney"})
    test_artist1 = Artist.new({:name => "Beyonce"})
    test_artist.save
    test_artist1.save
    expect(Artist.all).to eq [test_artist, test_artist1]
  end

end
