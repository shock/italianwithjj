class Notifier < ActionMailer::Base
  
   def signup_notification(student)
     recipients $GLOBALS[:admin][:email_recipients]
     bcc        $GLOBALS[:admin][:email_bcc]
     from       "ItalianWithJJ.com <noreply@italianwithjj.com>"
     subject    "New Student Possibility"
     body       :student => student
   end

end
