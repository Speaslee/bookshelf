class Book < ActiveRecord::Base
  belongs_to :library
  #belongs_to :user, through: :checkouts

  def is_checked_out
    if checked_out.nil?
      update! checked_out: Time.now
      update! due_date: 14.days.from_now

    end
  end

  def checked_out?
    !checked_out.nil?
  end

  def return_book
    update! checked_out: nil
    update! due_date: nil
  end
end
