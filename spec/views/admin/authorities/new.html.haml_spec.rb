require 'rails_helper'

RSpec.describe "admin/authorities/new", type: :view do
  before(:each) do
    assign(:admin_authority, Authority.new())
  end

  it "renders new admin_authority form" do
    render

    assert_select "form[action=?][method=?]", authorities_path, "post" do
    end
  end
end
