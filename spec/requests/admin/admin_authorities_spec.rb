require 'rails_helper'

RSpec.describe "Admin::Authorities", type: :request do
  describe "GET /admin_authorities" do
    it "works! (now write some real specs)" do
      get admin_authorities_index_path
      expect(response).to have_http_status(200)
    end
  end
end
