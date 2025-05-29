# spec/controllers/votes_controller_spec.rb
require 'rails_helper'

RSpec.describe VotesController, type: :controller do
  include Devise::Test::ControllerHelpers

  let(:user) { create(:user) }
  let(:book) { create(:book) }
  let(:recommendation) { create(:recommendation, user: user, book: book) }

  before { sign_in user }

  describe "POST #create" do
    context "with valid recommendation_id" do
      it "creates a vote" do
        expect {
          post :create, params: { recommendation_id: recommendation.id }, format: :turbo_stream
        }.to change(Vote, :count).by(1)
      end

      it "responds with turbo stream" do
        post :create, params: { recommendation_id: recommendation.id }, format: :turbo_stream
        expect(response.media_type).to eq("text/vnd.turbo-stream.html")
      end
    end

    context "with invalid recommendation_id" do
      it "raises ActiveRecord::RecordNotFound" do
        expect {
          post :create, params: { recommendation_id: 9999 }
        }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end
end
