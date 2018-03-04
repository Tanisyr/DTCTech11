require 'test_helper'

class RecipeTest < ActiveSupport::TestCase
  def setup
    #@recipe = Recipe.new(name: "vegetable", description: "great vegetable recipe")
    @chef = Chef.create!(chefname: "mashrur", email: "mashrur@example.com",
                    password: "password", password_confirmation: "password")
    @recipe = @chef.recipes.build(name: "vegetable", description: "great vegetable recipe")
  end
 
  
  test "recipe should be valid" do
    assert @recipe.valid?
  end
  
  test "name should be present" do
    @recipe.name = " "
    assert_not @recipe.valid?
  end

  test "description should be present" do
    @recipe.description = " "
    assert_not @recipe.valid?
  end
  
  test "description shouldn't be less than 5 characters" do
    @recipe.description = "a" * 3
    assert_not @recipe.valid?
  end
  test "description shouk dnot be more than 500 characters" do
    @recipe.description = "a" * 501
    assert_not @recipe.valid?
  end
end