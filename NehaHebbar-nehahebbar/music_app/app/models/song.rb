class Song < ActiveRecord::Base
  belongs_to :artist
  validates_presence_of :title, :year 
end
