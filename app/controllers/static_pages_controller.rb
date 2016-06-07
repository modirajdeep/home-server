class StaticPagesController < ApplicationController
  def home
    if logged_in?
    redirect_to browse_url
    else
     @user = User.new
    end
  end

  def help
  end
  
  def about
  end
  
  def settings
  end
  
  def guest
    Dir.chdir("/home/ubuntu/container")
    @files = Dir.glob("*")
  end
  
end
