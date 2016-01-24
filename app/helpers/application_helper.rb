module ApplicationHelper
  def form_control_static(title, value = "", options = {})
    label = content_tag( :label, title, class: "column large-6" )
    value = t("blank") if value.blank?
    if value.is_a?(TrueClass) || value.is_a?(FalseClass)
      if value == true
        value = t("is_true")
      else
        value = t("is_false")
      end
    end
    html = content_tag( :p, value, class: "form-control-static" )
    html = label + content_tag( :div, html, class: "column large-6" )
    html = content_tag( :div, html, class: "row #{options[:class] if options[:class]}" )
  end


end
