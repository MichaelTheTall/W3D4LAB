require_relative("../db/sql_runner")

class Movie


  attr_reader :id
  attr_accessor :title, :genre, :budget

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @genre = options['genre']
    @budget = options['budget'].to_i
  end

  def self.map_items(movie_data)
    result = movie_data.map { |e| Movie.new(e)  }
    return result
  end

  def save()
    sql = "INSERT INTO movies
    (
      title,
      genre,
      budget
    )
    VALUES
    (
      $1, $2, $3
    )
    RETURNING id"
    values = [@title, @genre, @budget]
    movie = SqlRunner.run( sql, values ).first
    @id = movie['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM movies"
    values = []
    movies = SqlRunner.run(sql, values)
    return self.map_items(movies)
  end

  def update()
    sql = "UPDATE movies
    SET(
      title, genre, budget
      ) = (
        $1, $2, $3
      )
      WHERE id = $4"
      values=[@title, @genre, @budget, @id]
      SqlRunner.run(sql, values)
    end

    def delete()
      sql = "DELETE FROM movies WHERE id = $1"
      values=[@id]
      SqlRunner.run(sql, values)
    end

    def self.delete_all()
      sql = "DELETE FROM movies"
      values = []
      SqlRunner.run(sql, values)
    end

    def stars()
      sql = "SELECT stars.*
      FROM stars
      INNER JOIN castings
      ON castings.star_id = stars.id
      WHERE castings.movie_id = $1"
      values = [@id]
      stars = SqlRunner.run(sql, values)
      return Star.map_items(stars)
    end

    def cast()
      sql = "SELECT castings.fee FROM castings
      WHERE castings.movie_id = $1"
      values = [@id]
      list = SqlRunner.run(sql, values)
      return Casting.map_items(list)
    end

    def budget_remaining()
      fees = 0
      self.cast().each do |e|
        fees += e.fee.to_i
      end
      return @budget - fees
    end

  end
