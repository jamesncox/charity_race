class Race < ActiveRecord::Base 
    has_many :causes
    has_many :runners, through :causes 
end 