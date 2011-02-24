module ApplicationHelper

  def r(str)
    return unless str
    ::RDiscount.new(str,:filter_styles, :autolink).to_html.html_safe
  end
end
