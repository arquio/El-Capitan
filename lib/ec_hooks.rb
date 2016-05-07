class EcHooks < Redmine::Hook::ViewListener

    #User form
    render_on :view_users_form , :partial => 'user/form'

    #User account
    render_on :view_my_account , :partial => 'user/myaccount'
end