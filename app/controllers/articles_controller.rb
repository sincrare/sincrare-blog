class ArticlesController < ApplicationController
  ARTICLES_COUNT_PER_PAGE = 5

  # GET /articles
  def index
    @articles = Article.user_accessible(@authorityId).order_by_descending.take(ARTICLES_COUNT_PER_PAGE)

    if Article.user_accessible(@authorityId).count > ARTICLES_COUNT_PER_PAGE
      @past_link = '/articles/page/1'
    end
  end

  # GET /articles/1
  def show
    @article = Article.user_accessible(@authorityId).find_by(id: params[:id])

    if @article.present?
      past_article = Article.user_accessible(@authorityId).order_by_descending.where('entry_at < ?', @article.entry_at).first()
      if past_article.present?
        @past_link = article_path(past_article.id)
      end
      next_article = Article.user_accessible(@authorityId).order_by_ascending.where('entry_at > ?', @article.entry_at).first()
      if next_article.present?
        @next_link = article_path(next_article.id)
      end
    end
  end

  # GET /articles/page/1
  def page
    @articles = Article.user_accessible(@authorityId).order_by_descending.offset(current_page * ARTICLES_COUNT_PER_PAGE).take(ARTICLES_COUNT_PER_PAGE)

    if @articles.present?
      past_article = Article.user_accessible(@authorityId).order_by_descending.where('entry_at < ?', @articles.last.entry_at).first()
      if past_article.present?
        @past_link = article_path(past_article.id)
      end
      if current_page == 1
        @next_link = articles_path
      elsif current_page > 1
        @next_link = '/articles/page/%d' % (current_page - 1)
      end
    end

    render 'index'
  end

  # GET /articles/daily/2017/01/01/page/1
  def daily
    targetDay = datetime_parse(params[:year], params[:month], params[:day])
    @articles = Article.user_accessible(@authorityId).order_by_descending.where(entry_at: targetDay.to_time.all_day).offset(current_page * ARTICLES_COUNT_PER_PAGE).take(ARTICLES_COUNT_PER_PAGE)

    if @articles.present?
      past_article = Article.user_accessible(@authorityId).order_by_descending.where('entry_at < ?', @articles.last.entry_at).first()
      if past_article.present?
        past_articles_count = Article.user_accessible(@authorityId).where(entry_at: past_article.entry_at.to_time.all_day).count
        if (past_articles_count <= ARTICLES_COUNT_PER_PAGE)
          @past_link = '/articles/daily/%d/%d/%d/' % [past_article.entry_at.year, past_article.entry_at.month, past_article.entry_at.day]
        elsif(past_articles_count > ARTICLES_COUNT_PER_PAGE * (current_page + 1))
          @past_link = '/articles/daily/%d/%d/%d/page/%d' % [past_article.entry_at.year, past_article.entry_at.month, past_article.entry_at.day, current_page + 1]
        else
          @past_link = '/articles/daily/%d/%d/%d/page/%d' % [past_article.entry_at.year, past_article.entry_at.month, past_article.entry_at.day, past_articles_count / ARTICLES_COUNT_PER_PAGE]
        end
      end
      case current_page
        when 0 then
          next_article = Article.user_accessible(@authorityId).order_by_ascending.where('entry_at > ?', @articles.first.entry_at).first()
          if next_article.present?
            @next_link = '/articles/daily/%d/%d/%d/' % [next_article.entry_at.year, next_article.entry_at.month, next_article.entry_at.day]
          end
        when 1 then
          @next_link = '/articles/daily/%s/%s/%s' % [params[:year], params[:month], params[:day]]
        else
          @next_link = '/articles/daily/%s/%s/%s/page/%d' % [params[:year], params[:month], params[:day], current_page - 1]
      end
    end

    render 'index'
  end

  # GET /articles/monthly/2017/01/page/1
  def monthly
    targetMonth = datetime_parse(params[:year], params[:month])
    @articles = Article.user_accessible(@authorityId).order_by_descending.where(entry_at: targetMonth.to_time.all_month).offset(current_page * ARTICLES_COUNT_PER_PAGE).take(ARTICLES_COUNT_PER_PAGE)

    if @articles.present?
      past_article = Article.user_accessible(@authorityId).order_by_descending.where('entry_at < ?', @articles.last.entry_at).first()
      if past_article.present?
        past_articles_count = Article.user_accessible(@authorityId).where(entry_at: past_article.entry_at.to_time.all_month).count
        if (past_articles_count <= ARTICLES_COUNT_PER_PAGE)
          @past_link = '/articles/monthly/%d/%d/' % [past_article.entry_at.year, past_article.entry_at.month]
        elsif(past_articles_count > ARTICLES_COUNT_PER_PAGE * (current_page + 1))
          @past_link = '/articles/monthly/%d/%d/page/%d' % [past_article.entry_at.year, past_article.entry_at.month, current_page + 1]
        else
          @past_link = '/articles/monthly/%d/%d/page/%d' % [past_article.entry_at.year, past_article.entry_at.month, past_articles_count / ARTICLES_COUNT_PER_PAGE]
        end
      end
      case current_page
        when 0 then
          next_article = Article.user_accessible(@authorityId).order_by_ascending.where('entry_at > ?', @articles.first.entry_at).first()
          if next_article.present?
            @next_link = '/articles/monthly/%d/%d/' % [next_article.entry_at.year, next_article.entry_at.month]
          end
        when 1 then
          @next_link = '/articles/monthly/page/%s/%s' % [params[:year], params[:month]]
        else
          @next_link = '/articles/monthly/page/%s/%s/page/%d' % [params[:year], params[:month], current_page - 1]
      end
    end

    render 'index'
  end

  # GET /articles/search_by/keyword/page/1
  def search_by
    @articles = Article.user_accessible(@authorityId).order_by_descending.where('content like ? or title like ?', "%#{params[:keyword]}%", "%#{params[:keyword]}%").offset(current_page * ARTICLES_COUNT_PER_PAGE).take(ARTICLES_COUNT_PER_PAGE)

    if @articles.present?
      past_article = Article.user_accessible(@authorityId).order_by_descending.where('(content like ? or title like ?) and entry_at < ?', "%#{params[:keyword]}%", "%#{params[:keyword]}%", @articles.last.entry_at).first()
      if past_article.present?
        @past_link = '/articles/search_by/%s/page/%d' % [params[:keyword], current_page + 1]
      end
      if current_page == 1
        @next_link = '/articles/search_by/%s' % params[:keyword]
      elsif current_page > 1
        @next_link = '/articles/search_by/%s/page/%d' % [params[:keyword], current_page - 1]
      end
    end

    render 'index'
  end

  # GET /articles/tag/1/page/1
  def tag
    @articles = Article.includes(:tags).user_accessible(@authorityId).order_by_descending.where(tags: {id: params[:tag_id]}).offset(current_page * ARTICLES_COUNT_PER_PAGE).take(ARTICLES_COUNT_PER_PAGE)

    if @articles.present?
      past_article = Article.includes(:tags).user_accessible(@authorityId).order_by_descending.where(tags: {id: params[:tag_id]}).where('entry_at < ?', @articles.last.entry_at).first()
      if past_article.present?
        @past_link = '/articles/tag/%s/page/%d' % [params[:tag_id], current_page + 1]
      end
      if current_page == 1
        @next_link = '/articles/tag/%s' % params[:tag_id]
      elsif current_page > 1
        @next_link = '/articles/tag/%s/page/%d' % [params[:tag_id], current_page - 1]
      end
    end

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
