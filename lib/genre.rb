class Genre
    
    include Concerns::Findable
    
    @@all = []
    
    attr_accessor :name, :song

    def initialize(name)
        @name = name
        @songs = []
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

    def songs
        Song.all.each do |song| 
            if song.genre == self && !@songs.include?(song)
                
                @songs << song

            end
        end
        @songs
    end

    def add_song(song)
        song.genre = self if song.genre.nil?
        @songs << song if !@songs.include?(song)
    end

    def artists
        @songs.map{|song| song.artist}.uniq
    end

    

    

end