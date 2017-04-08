require 'rails_helper'

RSpec.describe "admin/authorities/show", type: :view do
  before(:each) do
    @admin_authority = assign(:admin_authority, Authority.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
