class MainController < ApplicationController

  def home
    @student = Student.new(session[:student_params])
  end
  
  def login_form
  end
  
  def login
    if params[:password].to_s == "valdimir"
      flash[:notice]="Login successful."
      session[:user] = true
      redirect_to( CGI::unescape( params[:ref] ) )
    else
      flash[:notice] = "Incorrect password.  Try again!"
      redirect_to( :controller=>"main", :action=>"login_form", :ref=>params[:ref] )
    end
  end
  
  def logout
    session[:user] = nil
    flash[:notice] = "Logout successful."
    redirect_to("/")
  end
    
end
