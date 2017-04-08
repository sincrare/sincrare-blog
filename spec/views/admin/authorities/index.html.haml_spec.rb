require 'rails_helper'

RSpec.describe "admin/authorities/index", type: :view do
  before(:each) do
    assign(:authorities, [
      Authority.create!(),
      Authority.create!()
    ])
  end

  it "renders a list of admin/authorities" do
    render
  end
end
