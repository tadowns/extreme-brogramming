class PagesController < ApplicationController
  def home
    redirect_to start_path if user_signed_in?
  end
end
