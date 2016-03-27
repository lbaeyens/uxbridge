class Customer < ActiveRecord::Base
  belongs_to :title
  belongs_to :postalcode
end
