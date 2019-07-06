class Runner < ActiveRecord::Base
    has_secure_password
    has_many :causes
    has_many :races, through :causes  

    def slug 
        username.downcase.gsub(" ", "-")
    end 
      
    def self.find_by_slug(slug)
        Runner.all.find do |runner|
            runner.slug == slug.downcase
        end
    end 

end