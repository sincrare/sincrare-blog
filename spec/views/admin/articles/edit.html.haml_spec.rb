require 'rails_helper'

RSpec.describe "admin/articles/edit", type: :view do
  before(:each) do
    @admin_article = assign(:admin_article, Article.create!())
  end

  it "renders the edit admin_article form" do
    render

    assert_select "form[action=?][method=?]", admin_article_path(@admin_article), "post" do
    end
  end
end
