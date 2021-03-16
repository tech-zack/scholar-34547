require 'rails_helper'

RSpec.describe "Types", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/types/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /search" do
    it "returns http success" do
      get "/types/search"
      expect(response).to have_http_status(:success)
    end
  end

end
