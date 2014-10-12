require './spec_helper'

# We're now requiring and descring an Item class.
# Recall that all your new code/files should be created in the lib folder

describe Item do

  # Just like before, the subject simply sets a variable
  # In this case a variable item is being set to an instance of rubies
  describe "example item of rubies weighing 20 lbs" do
    subject { Item.new("Rubies", 20) }

    # Expect that now when you check the instantiated item's name and weight,
    # for it to match the information passed in above.
    its(:name) { should eq("Rubies") }
    its(:weight) { should eq(20) }
  end

  describe "example item of nuts weighing 10 lbs" do
    subject { Item.new("Nuts", 10) }

    # Expect that now when you check the instantiated item's name and weight,
    # for it to match the information passed in above.
    its(:name) { should eq("Nuts") }
    its(:weight) { should eq(10) }
  end

end
