require 'rails_helper'

RSpec.describe "admin/comments/new", type: :view do
  before(:each) do
    assign(:admin_comment, Comment.new())
  end

  it "renders new admin_comment form" do
    render

    assert_select "form[action=?][method=?]", comments_path, "post" do
    end
  end
end
