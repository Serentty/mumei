class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :set_board
  def set_board
    @board = Board.find_by(seo_name:params[:board])
    if @board == nil
      not_found
    end
    default_url_options[:board] = params[:board]
  end
  after_action :prepare_unobtrusive_flash
  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end
end
