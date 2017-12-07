class Customer < ApplicationRecord
  belongs_to :title
  belongs_to :postalcode
end
