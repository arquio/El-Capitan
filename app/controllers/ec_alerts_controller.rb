class EcAlertsController < ApplicationController
  unloadable
  before_filter :check_authorization , :only => [:index , :create]

  def index
  end


  def update
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
