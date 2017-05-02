class ArticlesController < ApplicationController
  ARTICLES_COUNT_PER_PAGE = 5

  # GET /articles
  def index
    @articles = Article.user_accessible(@authorityId).order_by_descending.take(ARTICLES_COUNT_PER_PAGE)
  end

  # GET /articles/1
  def show
    @article = Article.user_accessible(@authorityId).find_by(id: params[:id])
  end

  # GET /articles/page/1
  def page
    @articles = Article.user_accessible(@authorityId).order_by_descending.offset(current_page * ARTICLES_COUNT_PER_PAGE).take(ARTICLES_COUNT_PER_PAGE)
    render 'index'
  end

  # GET /articles/daily/2017/01/01/page/1
  def daily
    targetDay = datetime_parse(params[:year], params[:month], params[:day])
    @articles = Article.user_accessible(@authorityId).order_by_descending.where(entry_at: targetDay.to_time.all_day).offset(current_page * ARTICLES_COUNT_PER_PAGE).take(ARTICLES_COUNT_PER_PAGE)
    render 'index'
  end

  # GET /articles/monthly/2017/01/page/1
  def monthly
    targetMonth = datetime_parse(params[:year], params[:month])
    @articles = Article.user_accessible(@authorityId).order_by_descending.where(entry_at: targetMonth.to_time.all_month).offset(current_page * ARTICLES_COUNT_PER_PAGE).take(ARTICLES_COUNT_PER_PAGE)
    render 'index'
  end

  # GET /articles/search_by/keyword/page/1
  def search_by
    @articles = Article.user_accessible(@authorityId).order_by_descending.where('content like ? or title like ?', "%#{params[:keyword]}%", "%#{params[:keyword]}%").offset(current_page * ARTICLES_COUNT_PER_PAGE).take(ARTICLES_COUNT_PER_PAGE)
    render 'index'
  end

  # GET /articles/tag/1/page/1
  def tag
    @articles = Article.includes(:tags).user_accessible(@authorityId).order_by_descending.where(tags: {id: params[:tag_id]}).offset(current_page * ARTICLES_COUNT_PER_PAGE).take(ARTICLES_COUNT_PER_PAGE)
    render 'index'
  end

  # POST /articles/1/entry_comment
  def entry_comment
    @article = Article.includes(:authorities).find_by(id: params[:id], authorities: {id: @authorityId}, is_draft: false)
    if @article.present?
      @comment = Comment.new(article_id: @article.id, entry_user_name: comment_params[:entry_user_name], content: comment_params[:content], entry_user_id: @authorityId)
      if @comment.save
        redirect_to article_path(@article, anchor: :comments), notice: 'コメントを投稿しました。'
      else
        redirect_to article_path(@article, anchor: :comments), notice: 'コメントの投稿に失敗しました。'
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tags
      @tags = Tag.all
    end

    def set_recent_comments
      @recent_comments = Comment.user_accessible(@authorityId).take(RECENT_COMMENTS_COUNT)
    end

    def current_page
      page = 0
      if params[:page_id].present?
        page = params[:page_id].to_i
      end
      return page
    end

    def datetime_parse(year, month = '1', day = '1')
      date = nil
      if year.present? && month.present? && day.present?
        date = DateTime.parse(year.rjust(4, '0') + month.rjust(2, '0') + day.rjust(2, '0'))
      end
      return date
    end

    # Only allow a trusted parameter "white list" through.
    def comment_params
      params.require(:comment).permit(:entry_user_name, :content)
    end
end
