class Song
    
    @@all = []
    
    attr_accessor :name, :artist, :genre

    def initialize(name, artist = nil, genre = nil)
        @name = name
        self.artist = artist if !artist.nil?
        self.genre = genre if !genre.nil?
    end

    def save
        @@all << self
    end

    def self.all 
        @@all
    end

    def self.destroy_all
        @@all.clear
    end

    def self.create(name)
        new_obj = self.new(name)
        new_obj.save
        new_obj
    end

    def artist=(artist)

        @artist = artist
        @artist.add_song(self)
        

    end

    def genre=(genre)
        @genre = genre
        @genre.add_song(self)
    end

    def self.new_from_filename(file)

        new_file_format = file.split(' - ')
        new_file_format[2] = new_file_format[2].split('.mp3')
        new_names = new_file_format.flatten
        
        artist = Artist.find_or_create_by_name(new_names[0])
        song = Song.find_or_create_by_name(new_names[1])
        genre = Genre.find_or_create_by_name(new_names[2])

        song.artist = artist
        song.genre = genre
        
        song
        
    end

    def self.create_from_filename(filename)
        new_from_filename(filename)
        
    end
    
end