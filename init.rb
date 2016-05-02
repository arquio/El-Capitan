require_dependency 'users_path'
require_dependency 'El_Capitan_Hooks'

Redmine::Plugin.register :el_capitan do
  name 'El Capitan plugin'
  author 'Agiliacenter'
  description 'Redmine plugin to control worked hours for each user and alert each week.'
  version '0.0.1'
  url 'http://agiliacenter.com'
  author_url 'http://agiliacenter.com'

  Rails.configuration.to_prepare do
    User.send(:include , ElCapitan::Patches::UsersPatch)
  end
end
