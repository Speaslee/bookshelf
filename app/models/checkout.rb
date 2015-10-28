class Checkout < ActiveRecord::Base
  belongs_to :user
  belongs_to :book
  
  def overdue?
    checked_out? && Time.now > due_date
  end
end
