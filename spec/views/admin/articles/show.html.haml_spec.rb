require 'rails_helper'

RSpec.describe "admin/articles/show", type: :view do
  before(:each) do
    @admin_article = assign(:admin_article, Article.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
