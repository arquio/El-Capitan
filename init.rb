require_dependency 'users_path'
require_dependency 'ec_hooks'

Redmine::Plugin.register :el_capitan do
  name 'El Capitan plugin'
  author 'Agiliacenter'
  description 'Redmine plugin to control worked hours for each user and alert each week.'
  version '1.0.0'
  url 'http://agiliacenter.com'
  author_url 'http://agiliacenter.com'

  project_module :el_capitan do
    permission :manage_el_capitan, { :ec_alerts => [:index , :update] }
  end

  menu :top_menu , :el_capitan , {:controller => 'ec_alerts' , :action => 'index'} , :caption => :ec_plugin_title


  Rails.configuration.to_prepare do
    User.send(:include , ElCapitan::Patches::UsersPatch)
  end
end
