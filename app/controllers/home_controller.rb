class HomeController < ApplicationController
  def top
    session[:selected_tikuid] = nil
    session[:selected_keyword] = nil
  end

  def search
    if params[:keyword].blank?
     redirect_to root_path, notice: "キーワードを入力してください" 
    else
     session[:selected_keyword] ||= params[:keyword]

        @districts = District.where("name like ?","%#{session[:selected_keyword]}%")
        session[:selected_tikuid] = []
        @districts.each do |district|
          session[:selected_tikuid].push(district.id)
        end
        @houses = House.where(district_id: session[:selected_tikuid])
      render "houses/index"
    end
  end
end