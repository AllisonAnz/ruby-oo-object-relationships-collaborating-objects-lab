class Song


    attr_accessor :name, :artist #<sets the artist object to belong to the song

    @@all = []

    def initialize(name)
        @name = name
        save
    end

    def save
        @@all << self
    end

    def self.all
        @@all
    end
    
    # creates a new instance of a song from the file that's passed (FAILED - 6)
    # associates new song instance with the artist from the filename (FAILED - 7)
    def self.new_by_filename(filename)
        artist, song = filename.split(" - ")
        new_song = self.new(song)
        new_song.artist_name = artist
        new_song
    end

    # accepts an artist's name, finds or creates an Artist instance 
    # and assigns it to the Song's artist attribute
    def artist_name=(name)
        self.artist = Artist.find_or_create_by_name(name)
        artist.add_song(self)
    end

end
