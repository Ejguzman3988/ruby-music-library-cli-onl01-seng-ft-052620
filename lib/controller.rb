class MusicLibraryController

    def initialize(file_path = './db/mp3s')

        
        MusicImporter.new(file_path).import
        

    end


    def call

        puts "Welcome to your music library!"
        puts "To list all of your songs, enter 'list songs'."
        puts "To list all of the artists in your library, enter 'list artists'."
        puts "To list all of the genres in your library, enter 'list genres'."
        puts "To list all of the songs by a particular artist, enter 'list artist'."
        puts "To list all of the songs of a particular genre, enter 'list genre'."
        puts "To play a song, enter 'play song'."
        puts "To quit, type 'exit'."
        puts "What would you like to do?"
        input = gets.chomp
        
        until input == 'exit'
    
            case input
            
            when 'list songs'
                list_songs
                break
            
            when 'list artists'
                list_artists
                break

            when 'list genres'
                list_genres
                break

            when 'list artist'
                list_songs_by_artist
                break

            when 'list genre'
                list_songs_by_genre
                break

            when 'play song'
                play_song
                break
            else
                puts "What would you like to do?"
                input = gets.chomp
            end
        end
    end


    def list_songs

        alphabetize(Song.all).each_with_index do |song, index|
            puts "#{index+1}. " + song.artist.name + ' - ' + song.name + ' - ' + song.genre.name
        end
        
        
    end

    def list_artists

        alphabetize(Artist.all).each_with_index do |artist, index|
            puts "#{index+1}. " + artist.name
        end
    end

    def list_genres

        alphabetize(Genre.all).each_with_index do |genre, index|
            puts "#{index+1}. " + genre.name
        end
    end

    def list_songs_by_artist
        puts "Please enter the name of an artist:"
        name = gets.chomp

        songs = Artist.find_or_create_by_name(name).songs

        alphabetize(songs).each_with_index do |song, index|
            puts "#{index+1}. " + song.name + " - " + song.genre.name
        end

    end


    def list_songs_by_genre
        puts "Please enter the name of a genre:"
        name = gets.chomp

        songs = Genre.find_or_create_by_name(name).songs

        
        alphabetize(songs).each_with_index do |song, index|
            puts "#{index+1}. " + song.artist.name + " - " + song.name
        end
    end

    def play_song
        
        
        puts "Which song number would you like to play?"
        number = gets.chomp.to_i - 1


        songs = alphabetize(Song.all)

        if !(number >= songs.length) && !(number < 0)
            song = songs[number]
            puts "Playing #{song.name} by #{song.artist.name}"
        end
    end

    def alphabetize(list)

        list.sort_by{|type| type.name}

    end

    
end