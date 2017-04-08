require 'rails_helper'

RSpec.describe "admin/tags/edit", type: :view do
  before(:each) do
    @admin_tag = assign(:admin_tag, Tag.create!())
  end

  it "renders the edit admin_tag form" do
    render

    assert_select "form[action=?][method=?]", admin_tag_path(@admin_tag), "post" do
    end
  end
end
