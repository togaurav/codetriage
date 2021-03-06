class PagesController < ApplicationController

  layout :get_layout

  def index
    @repos = Repo.order_by_issue_count
	  @repos_subs = current_user.repo_subscriptions.page(params[:page]||1).per_page(params[:per_page]||50) if user_signed_in?
  end

  def show
    render "pages/show/#{params[:id]}"
  end

  private

  def get_layout
    params[:action] == 'index' ? 'home' : 'application'
  end
end
