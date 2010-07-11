class Notifier < ActionMailer::Base
  
   def signup_notification(student)
     recipients $GLOBALS[:admin][:email_recipients]
     bcc        $GLOBALS[:admin][:email_bcc]
     from       "ItalianWithJJ.com <jeniferjacksonmusic@yahoo.com>"
     subject    "New Student Possibility - #{student.name}"
     body       :student => student
     content_type "text/html"
   end

end
