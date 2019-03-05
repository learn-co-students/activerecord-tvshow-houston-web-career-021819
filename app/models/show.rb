class Show < ActiveRecord::Base
    def self.highest_rating
        Show.maximum(:rating)
    end

    def self.most_popular_show
        popular_show = Show.find_by rating: self.highest_rating
        return popular_show
    end

    def self.lowest_rating
        Show.minimum(:rating)
    end
    
    def self.least_popular_show
        failing_show = Show.find_by rating: self.lowest_rating
        return failing_show
    end

    def self.ratings_sum
        sum = 0
        Show.all.each do |show|
            sum += show.rating
        end
        return sum
    end

    def self.popular_shows
        popular_entries = Show.where("rating > ?", 5)
        return popular_entries
    end

    def self.shows_by_alphabetical_order
        Show.all.order(name: :asc)
    end 
end