class MainController < ApplicationController

  def home
    @student = Student.new(session[:student_params])
  end
    
end
