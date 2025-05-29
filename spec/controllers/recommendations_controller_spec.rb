# spec/controllers/recommendations_controller_spec.rb
require 'rails_helper'

RSpec.describe RecommendationsController, type: :controller do
  include Devise::Test::ControllerHelpers

  let(:user) { create(:user) }
  let(:book) { create(:book) }
  let!(:recommendation) { create(:recommendation, user: user, book: book) }

  describe "GET #index" do
    it "returns success response" do
      get :index
      expect(response).to be_successful
    end

    it "assigns trending recommendations" do
      get :index
      expect(assigns(:recommendations)).to include(recommendation)
    end
  end

  describe "GET #new" do
    before { sign_in user }

    it "assigns a new recommendation" do
      get :new
      expect(assigns(:recommendation)).to be_a_new(Recommendation)
    end
  end

  describe "POST #create" do
    before { sign_in user }

    context "with valid params" do
      it "creates a new recommendation" do
        expect {
          post :create, params: {
            recommendation: { book_id: book.id, review: "Amazing book!" }
          }
        }.to change(Recommendation, :count).by(1)
      end

      it "redirects to the index with notice" do
        post :create, params: {
          recommendation: { book_id: book.id, review: "Amazing book!" }
        }
        expect(response).to redirect_to(recommendations_path)
        expect(flash[:notice]).to eq("Recommendation created!")
      end
    end

    context "with invalid params" do
      it "renders the new template again" do
        post :create, params: { recommendation: { book_id: nil, review: "" } }
        expect(response).to render_template(:new)
      end
    end
  end
end
