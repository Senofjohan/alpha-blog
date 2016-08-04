require 'test_helper'

class SignUpUsersTest < ActionDispatch::IntegrationTest

  test "should successfully sign up a user" do
    get signup_path
    assert_template 'users/new'
    assert_difference 'User.count', 1 do
      post_via_redirect users_path, user: {username: "testerman", email: "myemail@email.com", password: "superpass"}
    end
    assert_template 'users/show'
  end

end