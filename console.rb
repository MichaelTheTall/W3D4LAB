require_relative('models/casting.rb')
require_relative('models/movie.rb')
require_relative('models/star.rb')

require('pry-byebug')

Casting.delete_all()
Star.delete_all()
Movie.delete_all()

star1 = Star.new({'first_name' => 'Doot', 'last_name' => 'Dootman'})
star2 = Star.new({'first_name' => 'Bob', 'last_name' => 'Boberton'})
star3 = Star.new({'first_name' => 'Jennifer', 'last_name' => 'Jennings'})

star1.save()
star2.save()
star3.save()

movie1 = Movie.new({'title' => 'Dootmaster', 'genre' => 'Doot Fiction', 'budget' => '50000000'})
movie2 = Movie.new({'title' => 'Dootmaster 2: Electric Dootaloo', 'genre' => 'Doot Fiction', 'budget' =>'200000000'})
movie3 = Movie.new({'title' => 'Dead Bob', 'genre' => 'Thriller', 'budget' =>'100000'})
movie4 = Movie.new({'title' => 'Space IN SPACE', 'genre' => 'Sci-fi', 'budget' =>'5000000'})

movie1.save()
movie2.save()
movie3.save()
movie4.save()

casting1 = Casting.new({'movie_id' => movie1.id, 'star_id' => star1.id, 'fee' => '10000000'})
casting2 = Casting.new({'movie_id' => movie2.id, 'star_id' => star1.id, 'fee' => '150000000'})
casting3 = Casting.new({'movie_id' => movie3.id, 'star_id' => star2.id, 'fee' => '10000'})
casting4 = Casting.new({'movie_id' => movie4.id, 'star_id' => star3.id, 'fee' => '1000000'})

casting1.save()
casting2.save()
casting3.save()
casting4.save()

binding.pry
nil
