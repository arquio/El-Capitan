namespace :el_capitan do
  desc "Gets Week hours for all members that have tracking activated"
  task :weekhours => :environment do
    EcHours.getWeekHours
  end
end
