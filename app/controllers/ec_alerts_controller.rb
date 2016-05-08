class EcAlertsController < ApplicationController
  unloadable
  before_filter :check_authorization , :only => [:index , :create , :testEmail , :week_report]

  def index
    @members = User.where('mail != ?' , '')
  end


  def update
    members = Array(params[:members])
    groups = Array(params[:groups])

    if members.count == 0  && groups.count != 0
      flash[:error] = l(:ec_members_not_selected)

    else

      users = User.where(tracking: true)

      users.each do |user|
        user.tracking = false
        user.save
      end

      members.each do |member|
        user = User.find(id=member.to_i)
        user.tracking = true
        user.save
      end

      user_groups = User.where(group_tracking: true)

      user_groups.each do |user|
        user.group_tracking = false
        user.save
      end

      groups.each do |member|
        user = User.find(id=member.to_i)
        user.group_tracking = true
        user.save
      end

      flash[:notice] = l(:ec_config_saved)
    end

    redirect_to :back

  end

  def testEmail
    members = User.where(tracking:true)

    if members.count == 0
      flash[:error] = l(:ec_members_not_selected)

    else
      EcHours.getWeekHours
      flash[:notice] = l(:ec_test_email_done)
    end

    redirect_to :back

  end

  def week_report
    @members = User.where('weekly_hours > ? ' , 0)
    @period = Date.today.beginning_of_week.strftime('%d/%m/%Y') + " - " + Date.today.strftime('%d/%m/%Y')
  end

  private

  def check_authorization
    member = Member.where(user_id: User.current).first

    if !member.nil?
      if member.roles.count > 0

        member.roles.each do |role|
          if role.has_permission?(:manage_el_capitan)
            return true
          end
        end
      end
    end
    render '403'
  end
end
