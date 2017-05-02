class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_authority
  before_action :set_tags
  before_action :set_recent_comments
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
      @recent_comments = Comment.includes(article: :authorities).where(authorities: {id: @authorityId}).take(RECENT_COMMENTS_COUNT)
    end
end
