module ApplicationHelper
    def error(object)
        render(partial: 'additions/errors', locals: { object: object })
    end

    def view_status(boolean, options = {})
        options[:true_text] ||= ''
        options[:false_text] ||= ''
        if boolean
            content_tag(:span, options[:true_text], class: 'glyphicon glyphicon-ok-circle')
        else
            content_tag(:span, options[:false_text], class: 'glyphicon glyphicon-ban-circle')
        end
    end

    # All three methods below were necessary to support bootstrap modals for
    # sign-in, sign-up in application layout/navbar.
    def resource_name
      :user
    end

    def resource
      @resource ||= User.new
    end

    def devise_mapping
      @devise_mapping ||= Devise.mappings[:user]
  end


end
