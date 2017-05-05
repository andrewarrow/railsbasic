class ApplicationMailer < ActionMailer::Base
  default from: 'support@example.com'
  layout 'mailer'

  def forgot(user, clear)
    @password = clear
    mail(:to => user.email, :subject => 'welcome to railsbasic. here is your password:' )
  end
end
