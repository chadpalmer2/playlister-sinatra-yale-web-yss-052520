class Song < ActiveRecord::Base
    belongs_to :artist
    has_many :song_genres
    has_many :genres, through: :song_genres

    def slug
        Slugifiable.slug(name)
    end

    def self.find_by_slug(slug)
        Song.all.find {|artist| artist.slug == slug}
    end
end