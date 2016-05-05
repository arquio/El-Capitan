class EcMailer < ActionMailer::Base
  default from: Setting.mail_from

  def send_email (user)
    @user = user
    @totalhours = @user.TotalWeekHours
    @period = Date.today.beginning_of_week.strftime('%d/%m/%Y') + " - " + Date.today.strftime('%d/%m/%Y')
    mail :to => @user.mail, :subject => "El Capitan - Reporte de Horas"
  end
end