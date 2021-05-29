class Item < ApplicationRecord
    validates :name, :description, present: true
end
