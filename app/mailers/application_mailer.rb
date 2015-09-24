class ApplicationMailer < ActionMailer::Base
  default from: "kyle@localhost:3000"
  layout 'mailer'
end
