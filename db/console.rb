require('pry-byebug')
require_relative('../models/artist.rb')
require_relative('../models/album.rb')

Album.delete_all()
Artist.delete_all()

artist_1 = Artist.new({
  "name" => "Bob Dylan"
  })

artist_2 = Artist.new({
  "name" => "Led Zeppelin"
  })

artist_1.save
artist_2.save

album_1 = Album.new({
  "title" => "Blood on the Tracks",
  "genre" => "Folk Rock",
  "artist_id" => artist_1.id
  })

album_2 = Album.new({
  "title" => "Led Zeppelin II",
  "genre" => "Classic Rock",
  "artist_id" => artist_2.id
  })

album_3 = Album.new({
  "title" => "Blond on Blond",
  "genre" => "Folk Rock",
  "artist_id" => artist_1.id
  })

album_1.save
album_2.save
album_3.save

binding.pry
nil