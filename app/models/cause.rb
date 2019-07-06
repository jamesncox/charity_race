class Cause < ActiveRecord::Base 
    belongs_to :runner
    belongs_to :race 
end 