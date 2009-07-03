class StudentsController < ApplicationController
  # GET /students
  # GET /students.xml
  def index
    @students = Student.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @students }
    end
  end

  # GET /students/1
  # GET /students/1.xml
  def show
    @student = Student.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @student }
    end
  end

  # GET /students/new
  # GET /students/new.xml
  def new
    @student = Student.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @student }
    end
  end

  # GET /students/1/edit
  def edit
    @student = Student.find(params[:id])
  end

  # POST /students
  # POST /students.xml
  def create
    session[:student_params] = params[:student]
    @student = Student.new(params[:student])
      if @student.name.blank? || (@student.email.blank? && @student.phone.blank?)
        flash[:error] = '<div style="text-align:center"><p>Please enter your first name and an email address or a phone number, so I can contact you.  Thanks!</p></div>'
      elsif @student.save
        flash[:notice] = '<div style="text-align:center"><p>Thank you for contacting me!</p><p>I will be in touch soon!</p><p>-Jenifer</p></div>'
        Notifier.deliver_signup_notification(@student)
      else
        flash[:error] = '<div style="text-align:center"><p>Sorry, there were errors processing your submission.  Please try again.</p></div>'
      end
      redirect_to("/")
  end

  # PUT /students/1
  # PUT /students/1.xml
  def update
    @student = Student.find(params[:id])

    respond_to do |format|
      if @student.update_attributes(params[:student])
        flash[:notice] = 'Student was successfully updated.'
        format.html { redirect_to(@student) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @student.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /students/1
  # DELETE /students/1.xml
  def destroy
    @student = Student.find(params[:id])
    @student.destroy

    respond_to do |format|
      format.html { redirect_to(students_url) }
      format.xml  { head :ok }
    end
  end
end
