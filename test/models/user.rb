require 'test_helper'

class User < ActiveSupport::TestCase

  def setup
    @user = User.new(name: "Example User", email: "user@example.com", password: "password")
  end

   test "create user" do
     @user.save!
     assert_equal @user.save!, true
    end

    test "user can be admin" do
      @user.update(
      admin: true
      )
      assert_equal @user.admin, true
    end

end
