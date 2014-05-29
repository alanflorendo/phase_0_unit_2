# U2.W6: Create a Playlist from Driver Code


# I worked on this solo challenge by myself.


# Pseudocode
=begin

Error 1 (uninitialized constant Song):  add Song class
Error 2 (uninitialized constant Playlist):  add Playlist class
Error 3 (undefined method add for Playlist class):  add add method to Playlist class
	add a song to the songs array
Error 4 (undefined method num_of_tracks for Playlist class):  
	add num_of_tracks method to Playlist class
	return the array length of the num_of_tracks array
Error 5 (undefined method play for Song class):  
	add play method to Song class
	use strings to "play" the song
Error 6 (undefined method remove for Playlist class):  
	add remove method to Playlist class
	loop through each title to see if there is a match
	if there is a match,
		delete the song
		move each remaining song back one track (deleting the last (duplicate) track)
Error 7 (undefined method includes? for Playlist class):  
	add includes? method to Playlist class
Error 8 (undefined method play_all for Playlist class):  
	add play_all method to Playlist class
	for each song in the songs array, print the song title

=end


# Initial Solution
=begin
class Song

	def initialize(title, album)
		@title = title
		@album = album
	end

	def play
		puts "playing #{@title}..."
		puts "end of song"
	end

	def title
		@title
	end
end

class Playlist
	def initialize(*song)
		@songs = song
	end

	def add(*song)
		song.each { |title| @songs << title}
	end

	def num_of_tracks
		@songs.length
	end

	def remove(song_title)
		index = 0
		@songs.each do |element|
			if element.title == song_title.title
				until index == @songs.length 
					@songs[index] = @songs[index+1]
					index += 1
					puts "#{song_title.title} has been removed"
				end
				@songs.pop(1)
			else
				index += 1
			end
		end
	end

	def includes?(title)
		song_included = false
		@songs.each do |song|
			if song == title
				song_included = true
			end
		end
		return song_included
	end

	def play_all
		@songs.each do |song|
			print "playing #{song.title}..."
			puts "end of song"
		end
	end

	def display
		puts "\n     Playlist     "
		puts "******************"
		@songs.each do |song|
			puts "#{song.title}"
		end
	end
end

=end


# Refactored Solution

class Song
	attr_reader :title, :album

	def initialize(title, album)
		@title = title
		@album = album
	end

	def play
		puts "playing #{@title}..."
		puts "end of song"
	end
end

class Playlist
	def initialize(*song)
		@songs = song
	end

	def add(*song)
		song.each { |title| @songs << title}
	end

	def num_of_tracks
		@songs.length
	end

	def remove(song_title)
		@songs.delete(song_title)
	end

	def includes?(song_title)
		@songs.include?(song_title)
	end

	def play_all
		@songs.each { |song| song.play}
	end

	def display
		puts "\n     Playlist     "
		puts "******************"
		@songs.each do |song|
			puts "#{song.title}"
		end
	end
end





# DRIVER TESTS GO BELOW THIS LINE
one_by_one = Song.new("One by One", "Sirenia")
world_so_cold = Song.new("World So Cold", "Three Days Grace") 
going_under = Song.new("Going Under", "Evanescence")


my_playlist = Playlist.new(one_by_one, world_so_cold, going_under)
 
lying_from_you = Song.new("Lying From You", "Linkin Park")
angels = Song.new("Angels", "Within Temptation")

my_playlist.add(lying_from_you, angels)
p my_playlist.num_of_tracks == 5
going_under.play
my_playlist.remove(angels)
p my_playlist.includes?(lying_from_you) == true
p my_playlist.num_of_tracks == 4
my_playlist.play_all
my_playlist.display




# Reflection 
=begin
I really enjoyed this challenge.  Often I don't find the working by error-driven development very 
educational; I feel like I'm just going through a series of steps and being expressly told how to 
fix things.  That wasn't so much the case here.  The first few errors were easy; no classes or 
methods existed, so I knew I had to add them.  But then things got more complex--the answers weren't 
so obvious.  The error message made it clear that I needed to add a method, but it wasn't so clear 
exactly how I'd bring the necessary functionality to that method.  

I think this exercise really helped to get me more comfortable with classes (I was going to say that 
it solidified my understanding of classes, but that may have been a bit much.)  I feel that I get the 
general principles and, importantly, I can use trial and error to get my code to work.  I consistently 
get hung up on whether I need to use an attribute of an object or simply the name of the object 
itself--e.g., using song instead of song.title and vice-versa.  For the moment, I've used trial and 
error to solve this issue, but I know I need to develop more instinct regarding this issue.

I did my initial solution without consulting any outside resources.  I knew there must be easier ways 
to delete a song from a playlist array or to use include? to determine whether a song was included 
in the playlist.  I thought it would be good practice for me to deal with the inner logic of these 
two ideas using more basic control flow techniques (if, else, loops, etc.).  If I had done more 
research for these methods in my initial solution, I am not sure I would have been able to come up 
with any ideas for refactoring.
=end
