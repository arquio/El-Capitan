
module ElCapitan
  module Patches
    module UsersPatch
      def self.included(base)
        base.class_eval do
          safe_attributes 'weekly_hours'
          safe_attributes 'tracking'

          validates :weekly_hours , :numericality => {:greater_than_or_equal_to => 0}
        end
      end
    end
  end
end