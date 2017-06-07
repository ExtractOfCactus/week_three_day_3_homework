require('pg')
require_relative('../db/sql_runner.rb')
require_relative('artist.rb')

class Album

  attr_reader :id, :artist_id
  attr_accessor :title, :genre

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @genre = options['genre']
    @artist_id = options['artist_id'].to_i
  end

  def save()
    sql = "INSERT INTO albums
    (
    title,
    genre,
    artist_id
    )
    VALUES
    (
    '#{@title}',
    '#{@genre}',
    #{@artist_id}
    ) 
    RETURNING id;"
    @id = SqlRunner.run(sql)[0]["id"].to_i
  end

  def artist()
    sql = "SELECT * FROM artists WHERE id = #{artist_id}"
    results = SqlRunner.run(sql)
    artist_data = results[0]
    artist = Artist.new(artist_data)
    return artist
  end

  def update()
    sql = "UPDATE albums SET
    (
    title,
    genre,
    artist_id
    ) = (
    '#{@title}',
    '#{@genre}',
    #{artist_id})
    WHERE id = #{id}"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM albums WHERE id = #{@id}"
    SqlRunner.run(sql)
  end

  

  def Album.all()
    sql = "SELECT * FROM albums"
    albums = SqlRunner.run(sql)
    albums.map { |album| Album.new(album) }
  end

  def Album.delete_all()
    sql = "DELETE FROM albums"
    SqlRunner.run(sql)
  end

  


end