class Address< ActiveRecord::Base
belongs_to :user
validates_presence_of :street, :state, :zip, :city
end
