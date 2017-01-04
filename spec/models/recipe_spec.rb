require 'rails_helper'

RSpec.describe Recipe do
  describe ".quick_recipes" do # FactoryGirl saves me a lot of time and code
    it "returns recipes with a cooking time less than 30 min" do
      # pb_and_j = Recipe.create! do |r|
      #   r.name = "Peanut Butter & Jelly Sandwich"
      #   r.instructions = "It's Peanut Butter Jelly Time!"
      #   r.cooking_time = 5
      #   r.servings = 1
      # end
      #
      # pot_roast = Recipe.create! do |r|
      #   r.name = "Pot Roast"
      #   r.instructions = "Put the roast in a pot, turn on the stove, and wait."
      #   r.cooking_time = 240
      #   r.servings = 12
      # end
      #
      # cheerios = Recipe.create! do |r|
      #   r.name = "A Bowl of Cheerios"
      #   r.instructions = "bloop"
      #   r.cooking_time = 2
      #   r.servings = 1
      # end
      ################
      #
      # first_quick_recipe = FactoryGirl.create(:recipe, cooking_time: 5)
      # second_quick_recipe = FactoryGirl.create(:recipe, cooking_time: 4)
      # long_recipe = FactoryGirl.create(:recipe, cooking_time: 240)
      #
      ###############
      # even more concise

      quick_recipes = create_list(:recipe, 2, cooking_time: 5)
      slow_recipes = create_list(:recipe, 3, cooking_time: 240)

      results = Recipe.quick_recipes

      quick_recipes.each do |quick_recipe|
        expect(results).to include(quick_recipe)
      end

      slow_recipes.each do |slow_recipe|
        expect(results).to_not include(slow_recipe)
      end
    end
  end
end
