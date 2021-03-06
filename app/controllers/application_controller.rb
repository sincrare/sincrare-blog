class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_authority
  before_action :set_tags
  before_action :set_recent_comments
  before_action :set_monthly_count
  RECENT_COMMENTS_COUNT = 10

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name] )
      devise_parameter_sanitizer.permit(:sign_up, keys: [:comment] )
    end

  private

    def set_authority
      # 未ログインは権限1
      @authorityId = 1
      if user_signed_in?
        @authorityId = current_user.authority_id
      end
    end

    def set_tags
      @tags = Tag.all
    end

    def set_recent_comments
      @recent_comments = Comment.user_accessible(@authorityId).take(RECENT_COMMENTS_COUNT)
    end

    def set_monthly_count
      @monthly_articles_count = Article.user_accessible(@authorityId).group("to_char(entry_at, 'yyyy')").group("to_char(entry_at, 'MM')").count
    end

    def is_admin_accessible
      if user_signed_in? == false || current_user.id != 1
        redirect_to articles_path
      end
    end
end
