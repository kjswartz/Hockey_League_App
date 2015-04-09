module ApplicationHelper
  # Bootstrap Flash helper method.
  def bs_class(flash_type)
    { success: 'alert-success',
      danger:   'alert-danger',
      warning:   'alert-warning',
      notice:  'alert-info' }[flash_type] || flash_type.to_s
  end

  # customize icons for each flash type
  def bs_icon(flash_type)
    { success: 'ok',
      danger: 'exclamation-sign',
      warning: 'warning-sign',
      notice: 'info-sign' }[flash_type] || 'question-sign'
  end

  def close_alert
    button_tag(type: 'button', class: 'close', data: { dismiss: 'alert' }) do
      concat content_tag(:span, '&times;'.html_safe, 'aria-hidden' => 'true')
      concat content_tag(:span, 'Close', class: 'sr-only')
    end
  end

  def flash_messages(_opts = {})
    flash.each do |t, m|
      concat(content_tag(:div, m, role: 'alert', class: "alert #{bs_class(t.to_sym)} alert-dismissible") do
               concat close_alert
               concat content_tag(:i, nil, class: "glyphicon glyphicon-
                                  #{bs_icon(t.to_sym)}")
               concat ' '
               concat m
             end)
    end
    nil
  end
end
