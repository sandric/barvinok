require 'rails_helper'

describe UsersController do
	it "assigns the requested user to @user" do
    	user = create(:user)
    	get :show, id: user.slug
    	expect(assigns(:user)).to eq user
	end

	describe 'GET#show' do
		it "renders the :show template" do
			user = create(:user)
			get :show, id: user.slug
			expect(response).to render_template :show
		end
	end
end