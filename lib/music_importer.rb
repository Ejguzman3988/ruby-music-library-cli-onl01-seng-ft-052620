class MusicImporter


    attr_accessor :path

    def initialize(filepath)

        @path = filepath
        @list_filenames = []

    end

    def files

        @list_filenames = Dir[@path+"/*.mp3"]
       
        
        @list_filenames = @list_filenames.collect{|file| file.split("/").last}.flatten
        
        
        
        
    end

    def import

        files.each{|filename| Song.create_from_filename(filename)}

    end

end