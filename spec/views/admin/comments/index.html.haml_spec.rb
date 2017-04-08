require 'rails_helper'

RSpec.describe "admin/comments/index", type: :view do
  before(:each) do
    assign(:comments, [
      Comment.create!(),
      Comment.create!()
    ])
  end

  it "renders a list of admin/comments" do
    render
  end
end
