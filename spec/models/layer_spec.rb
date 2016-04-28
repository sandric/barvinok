require 'rails_helper'

describe Layer do

	it "is valid with name and color set" do
		layer = build(:layer)
		p layer
		expect(layer).to be_valid
	end

	it "is invalid without name" do
		layer = Layer.new()
		layer.valid?
		expect(layer.errors[:name]).to include("can't be blank")
	end
end