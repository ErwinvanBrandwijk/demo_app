module ApplicationHelper

  # Return a title on a per-page basis.
  def title
    base_title = "RoR app"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end
  
  def wrap(content)
    raw(content.split.map{ |s| wrap_long_string(s) }.join(' '))
  end

  private
  def wrap_long_string(text, max_width = 35)
    zero_width_space = "&#8203;"
    regex = /.{1,#{max_width}}/
    (text.length < max_width) ? text :
    text.scan(regex).join(zero_width_space)
  end

end
