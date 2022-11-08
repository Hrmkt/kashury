class HomeController < ApplicationController
  def top
    session[:selected_tikuid] = nil
  end
end