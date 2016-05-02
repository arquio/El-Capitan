class ElCapitanHooks < Redmine::Hook::ViewListener

    render_on :view_users_form , :partial => 'user/hours'

end