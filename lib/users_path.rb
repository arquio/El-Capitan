
module ElCapitan
  module Patches
    module UsersPatch
      def self.included(base)
        base.class_eval do
          unloadable

          safe_attributes 'weekly_hours'
          safe_attributes 'tracking'

          validates :weekly_hours , :numericality => {:greater_than_or_equal_to => 0}
          validate :tracking_can_be_activated

          #@brief Returns sum of hours that a user has spent on a week.
          #@param [in] week if nil, it uses current week, otherwise it will use the week param
          #return Total hours of the week
          def TotalWeekHours(week=nil)
            if week.nil?
              current_week = Time.now.strftime('%W').to_i
              return TimeEntry.where(:user_id => self.id , :tweek =>  current_week).sum(:hours)
            else
              return TimeEntry.where(:user_id => self.id , :tweek =>  week).sum(:hours)
            end
          end

          def tracking_can_be_activated
            if self.weekly_hours == 0 && self.tracking
              errors.add(:tracking ,l(:ec_tracking_cannot_be_actived))
              return false
            end

            return true
          end

        end
      end
    end
  end
end