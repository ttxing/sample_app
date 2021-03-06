require 'test_helper'

class UsersEditTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:michael)
    @other_user = users(:archer)
  end

  test "unsuccessful edit" do
    get edit_user_path(@user)
    patch user_path(@user), user: { name: '',
                                  email: 'foo@invalid',
                                  password: 'foo',
                                  password_confirmation: 'bar' }
    assert_template 'users/edit'
  end
end
