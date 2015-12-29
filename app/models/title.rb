class Title < ActiveRecord::Base
  validates :title, uniqueness: true
end
