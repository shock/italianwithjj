class Notifier < ActionMailer::Base
  
   def signup_notification(student)
#     recipients "JJ <jeniferjacksonmusic@yahoo.com>"
     recipients "bdoughty@yahoo.com"
     from       "ItalianWithJJ.com <noreply@italianwithjj.com>"
     subject    "New Student Possibility"
     body       :student => student
   end

end
