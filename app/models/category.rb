require 'active_record'


# Category model
class Category < ActiveRecord::Base
  validates :title, :description, length: {
    maximum: 255
  }
end
