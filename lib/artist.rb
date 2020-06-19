require 'pry'

include Concerns::Findable

class Artist
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
            if song.artist == self && !@songs.include?(song)
                
                @songs << song

            end
        end
        @songs
    end

    def add_song(song)
        song.artist = self if song.artist.nil?
        @songs << song if !@songs.include?(song)
    end

    def genres
        @songs.map{|song| song.genre}.uniq
    end

    


end