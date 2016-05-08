class EcMailer < ActionMailer::Base
  default from: Setting.mail_from

  def send_email (user)
    @user = user
    @totalhours = @user.TotalWeekHours
    @period = Date.today.beginning_of_week.strftime('%d/%m/%Y') + " - " + Date.today.strftime('%d/%m/%Y')
    mail :to => @user.mail, :subject => "El Capitan - #{t(:ec_subject)}"
  end

  def send_group_email(mails , members)
    @members = members
    @period = Date.today.beginning_of_week.strftime('%d/%m/%Y') + " - " + Date.today.strftime('%d/%m/%Y')
    mail :bcc => mails.join(",") , :subject => "El Capitan - #{t(:ec_subject)}"
  end
end