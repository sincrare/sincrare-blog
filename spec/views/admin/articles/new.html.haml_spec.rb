require 'rails_helper'

RSpec.describe "admin/articles/new", type: :view do
  before(:each) do
    assign(:admin_article, Article.new())
  end

  it "renders new admin_article form" do
    render

    assert_select "form[action=?][method=?]", articles_path, "post" do
    end
  end
end
