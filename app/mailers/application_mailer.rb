class ApplicationMailer < ActionMailer::Base
  default from: "WeightTracker <no-reply@weighttracker.herokuapp.com>"
  layout 'mailer'
end
