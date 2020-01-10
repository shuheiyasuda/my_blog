require "rails_helper"

describe RegisrationsController, type: :controller do

  describe "GET #signup" do
    it "renders the :signup template" do
      get :signup
      expect(response).to render_template :signup
    end
  end

  describe "GET #signup_2" do
    it "renders the :signup_2 template" do
      get :signup_2
      expect(response).to render_template :signup_2
    end
  end


end