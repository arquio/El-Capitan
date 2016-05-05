# Plugin's routes
# See: http://guides.rubyonrails.org/routing.html

get '/ec/config' , :to => 'ec_alerts#index' , :as => 'el_capitan_index'
post '/ec/config' , :to => 'ec_alerts#update' , :as => 'el_capitan_save'