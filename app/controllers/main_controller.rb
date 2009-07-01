class MainController < ApplicationController

  def home
    @student = Student.new
  end
    
end
