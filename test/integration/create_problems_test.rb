require 'test_helper'

class CreateProblemsTest < ActionDispatch::IntegrationTest
    
    def setup
      @user = User.create(username: "john", email: "john@example.com", 
                          password: "password", admin: false)
    end
  
    test "get new problem form and create problem" do
      sign_in_as(@user, "password")
      get new_problem_path
      assert_template 'problems/new'
      assert_difference 'Problem.count', 1 do
        post_via_redirect problems_path, problem: {title: "Integration testing", 
                description: "Not doing integration testing is bad", category_ids: []}
      end
      assert_template 'problems/show'
      assert_match "Integration testing", response.body
    end
  
end