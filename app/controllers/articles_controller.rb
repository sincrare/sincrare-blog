class ArticlesController < ApplicationController
  ARTICLES_COUNT_PER_PAGE = 5

  # GET /articles
  def index
    @articles = Article.includes(:authorities).where(authorities: {id: 1}).take(ARTICLES_COUNT_PER_PAGE)
  end

  # GET /articles/1
  def show
    @article = Article.find(params[:id])
  end

  # GET /articles/page/1
  def page
    @articles = Article.where('id = 1')
    render 'index'
  end

  # GET /articles/daily/2017/01/01
  def daily

    render 'index'
  end

  # GET /articles/monthly/2017/01
  def monthly

    render 'index'
  end

  # GET /articles/search_by/keyword
  def search_by

    render 'index'
  end

  # GET /articles/category_by/1
  def category_by

    render 'index'
  end

end
