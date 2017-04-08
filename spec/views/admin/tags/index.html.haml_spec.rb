require 'rails_helper'

RSpec.describe "admin/tags/index", type: :view do
  before(:each) do
    assign(:tags, [
      Tag.create!(),
      Tag.create!()
    ])
  end

  it "renders a list of admin/tags" do
    render
  end
end
