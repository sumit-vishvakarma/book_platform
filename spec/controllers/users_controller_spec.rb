require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "GET #show" do
    let(:user) { create(:user) }
    let!(:recommendations) { create_list(:recommendation, 3, user: user) }

    it "assigns the requested user to @user" do
      get :show, params: { id: user.id }
      expect(assigns(:user)).to eq(user)
    end

    it "assigns the user's recommendations to @recommendations" do
      get :show, params: { id: user.id }
      expect(assigns(:recommendations)).to match_array(recommendations)
    end

    it "renders the show template" do
      get :show, params: { id: user.id }
      expect(response).to render_template(:show)
    end

    it "raises ActiveRecord::RecordNotFound if user does not exist" do
      expect {
        get :show, params: { id: 'nonexistent' }
      }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end
end
