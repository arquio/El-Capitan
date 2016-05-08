# Plugin's routes
# See: http://guides.rubyonrails.org/routing.html

get '/ec/config' , :to => 'ec_alerts#index' , :as => 'el_capitan_index'
post '/ec/config' , :to => 'ec_alerts#update' , :as => 'el_capitan_save'
get '/ec/config/testEmail' , :to => 'ec_alerts#testEmail' , :as => 'el_capitan_test'
get '/ec/config/weekreport' , :to => 'ec_alerts#week_report' , :as => 'el_capitan_week_report'