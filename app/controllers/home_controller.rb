class HomeController < ApplicationController
  def top
  end
  
  def about
    redirect_to about_path
  end 
  
end
