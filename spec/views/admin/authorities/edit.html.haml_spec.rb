require 'rails_helper'

RSpec.describe "admin/authorities/edit", type: :view do
  before(:each) do
    @admin_authority = assign(:admin_authority, Authority.create!())
  end

  it "renders the edit admin_authority form" do
    render

    assert_select "form[action=?][method=?]", admin_authority_path(@admin_authority), "post" do
    end
  end
end
