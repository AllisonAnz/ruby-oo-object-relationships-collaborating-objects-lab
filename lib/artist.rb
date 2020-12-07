class Artist
    attr_accessor :name, :songs

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

    #Keeps track of an artists songs
    def add_song(song)
        song.artist = self
    end

    #lists all songs that belong to this artist
    def songs
        Song.all.select {|song| song.artist == self}
    end

    #.find_or_create_by_name
    # always returns an Artist instance
    # finds or creates an artist by name maintaining uniqueness of objects by name property
    # Creates new instance of Artist if none exist
    def self.find_or_create_by_name(name)
        self.find(name) ? self.find(name) : self.new(name)
    end

    def self.find(name)
        self.all.find {|artist| artist.name == name }
    end

    #list all of the artist's songs
    def print_songs
        songs.each {|song| puts song.name}
    end

    




end
