module EcHours

  #Starts the week report process.
  def self.getWeekHours
    members = User.where(tracking: true).where(group_tracking: false)

    members.each do |user|
      EcMailer.send_email(user).deliver
    end

    #group emails

    group_users = User.where(group_tracking: true)

    if !group_users.nil?
      members = User.where(tracking: true)
      mails = []

      group_users.each do |user|
        mails << user.mail
      end
      EcMailer.send_group_email(mails,members).deliver

    end
  end
end