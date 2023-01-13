class HomeController < ApplicationController
  def top
    session[:selected_tikuid] = nil
    session[:selected_keyword] = nil
    session[:selected_tag] = nil
  end

  def search
    session[:selected_keyword] = nil
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

  def tag_search
      session[:selected_tag] = nil
      if params[:selected_tag].blank?
         redirect_to houses_path
      else
         session[:selected_tag] ||= params[:selected_tag]

         if session[:selected_tikuid].nil?
            @houses = House.all
         else
            @houses = House.where(district_id: session[:selected_tikuid])
         end

         if session[:selected_tag].present?
          label = Label.find(session[:selected_tag])
          house_ids = []
          label.houses.each do |house|
            house_ids.push(house.id)
          end
          @houses = @houses.where(id: house_ids)
         end
          render "houses/index"
      end 
  end
end