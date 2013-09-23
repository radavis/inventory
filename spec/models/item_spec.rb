require 'spec_helper'

describe Item do
  it { should have_valid(:title).when("Burritos", "Burgers", "Hot Dogs") }
  it { should_not have_valid(:title).when(nil, "") }

  it { should have_valid(:description).when("delicious meals", "tasty snacks") }
  it { should_not have_valid(:description).when(nil, "") }

  it { should have_valid(:quantity).when(10, 100) }
  it { should_not have_valid(:quantity).when(nil, "") }
end
