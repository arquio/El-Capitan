class EcAlertsController < ApplicationController
  unloadable
  before_filter :check_authorization , :only => [:index , :create]

  def index
    @members = User.where('mail != ?' , '')
  end


  def update
    members = Array(params[:members])

    if members.length == 0
      redirect_to :back
      return
    end

    users = User.where(tracking=true)

    users.each do |user|
      user.tracking = false
      user.save
    end

    members.each do |user|
      user = User.find(id=user.to_i)
      user.tracking = true
      user.save
    end

    redirect_to :back
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
