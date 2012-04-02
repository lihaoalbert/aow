module ApplicationHelper
  def full_title(page_title)
    base_title = "Aow"
    if page_title.empty?
      base_title
    else
      %Q{#{base_title} | #{page_title}}
    end
  end

  def unsaved_param_tags(asset)
    params[asset][:tag_list].join.split(",").map { |x| Tag.find_by_name(x.strip) }.compact.uniq
  end
end
