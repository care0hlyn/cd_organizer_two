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
    test_artist = Artist.new({:name => "Beyonce"})
    test_artist1 = Artist.new({:name => "Paul McCartney"})
    test_artist.save
    test_artist1.save
    expect(Artist.all).to eq [test_artist, test_artist1]
  end

  it 'adds an album to the artist collection' do
    test_artist = Artist.new({:name => "The Strokes"})
    test_album = Album.new("Is This It")
    test_artist.add_album(test_album)
    expect(test_artist.albums).to eq [test_album]
  end

  it 'displays the albums for a given artist' do
    test_artist = Artist.new({:name => "Outkast"})
    test_album = Album.new("Aquemini")
    test_artist.add_album(test_album)
    test_album1 = Album.new("ATLiens")
    test_artist.add_album(test_album1)
    expect(test_artist.albums).to eq [test_album, test_album1]
  end
end

describe Album do
  it 'initializes an album with a title' do
    test_album = Album.new("Is This It")
    test_album.should be_an_instance_of Album
  end

  it 'saves the album to a list' do
    test_album = Album.new("Is This It")
    test_album.save
    expect(Album.all).to eq [test_album]
  end

end
