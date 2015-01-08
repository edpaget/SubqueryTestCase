require 'test_helper'

class RoleTest < ActiveSupport::TestCase
  attr_reader :user, :things, :roles
  
  setup do
    @user = users(:one)
    @things = Thingy.joins(:roles).where(roles: { user: user } )
    @roles = Role.where(resource: things)
  end

  test "produces a correct thing query" do
    assert_match(/\"resource_type\" = 'Thingy'/, things.to_sql)
  end
  
  test "produces a correct subquery" do
    assert_match(/IN \(SELECT.*\"resource_type\" = 'Thingy'/, roles.to_sql)
    p roles.to_sql
  end

  test "does not raise a statement invalid error" do
    assert_nothing_raised do
      roles.map(&:id)
    end
  end
end
