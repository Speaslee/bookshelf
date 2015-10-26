class Book < ActiveRecord::Base
  belongs_to :bookself

  def is_checked_out
    if checked_out.nil?
      update! checked_out: Time.now
      update! due_date: 14.days.from_now
    end
  end

  def checked_out?
    !checked_out.nil?
  end
end
