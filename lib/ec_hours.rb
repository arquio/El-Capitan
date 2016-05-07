module EcHours

  #Starts the week report process.
  def self.getWeekHours
    members = User.where(tracking: true)

    members.each do |user|
      EcMailer.send_email(user).deliver
    end
  end
end