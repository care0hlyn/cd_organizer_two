require './lib/artists'
require './lib/albums'


@selected_artist

def main_menu

  puts "\n\n***CD Collection***"

  puts "Press '1' to show artist menu."
  puts "Press '2' to show album menu."
  puts "Press 'x' to exit program.\n\n"

  user_decision = gets.chomp

  if user_decision == '1'
    artist_menu
  elsif user_decision == '2'
    album_menu
  elsif user_decision == 'x'
    puts "Goodbye!"
    exit
  else
    puts "Invalid."
    main_menu
  end
end

def artist_menu
  puts "Press 'a' to add new artist to collection."
  puts "Press 'l' to list artists."
  puts "Press 's' to search artists."
  puts "Press 'm' to go to main menu."

  user_decision = gets.chomp

  if user_decision == 'a'
    new_artist
  elsif user_decision == 'l'
    list_artist
  elsif user_decision == 's'
    search_artist
  elsif user_decision == 'm'
    main_menu
  else
    puts "Invalid."
  end
end

def new_artist
  puts "Enter artist name."
  user_artist_name = gets.chomp
  new_artist = Artist.new({:name => user_artist_name})
  new_artist.save
  puts "#{new_artist.name} has been added.\n"

  puts "\nEnter #{new_artist.name} album name."
  user_artist_album = gets.chomp
  new_album = Album.new(user_artist_album)
  new_artist.add_album(new_album)
  new_album.save
  puts "\n#{new_album.title} has been added.\n\n"
  artist_menu
end

def list_artist
  puts "Here is your artist collection:\n\n"
  Artist.all.each_with_index { |artist, index| puts "#{index+1}. #{artist.name}" }
  artist_menu
end

def search_artist
  puts "Enter artist to search:"
  user_decision = gets.chomp
  @selected_artist = Artist.all.select { |artist| user_decision == artist.name }

  if @selected_artist.length < 1
    puts "Artist not in collection."
    main_menu
  else
    @selected_artist.first.albums.each_with_index { |album, index| puts "#{index+1}. #{album.title}\n\n" }
  end
  puts "Press Y or N to add album to this artist."

  user_input = gets.chomp
  if user_input == 'y'
    another_album
  elsif user_input == 'n'
    artist_menu
  end
end

def another_album
  puts "Enter album title"
    title = gets.chomp
    new_album = Album.new(title)
    new_album.save
    @selected_artist.first.add_album(new_album)
    puts "#{new_album.title} has been added\n\n"
    artist_menu
end

def album_menu
  puts "Here is your artist + album collection:"

  Artist.all.each_with_index do |artist, index|
    puts "#{index+1}. #{artist.name}"
    artist.albums.each do |album|
      puts album.title

    end
  end
  main_menu
end

main_menu


