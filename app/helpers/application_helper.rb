module ApplicationHelper
  def full_tittle page_tittle=''
    base_tittle = 'Sample App'
    if page_tittle.empty?
      base_tittle
    else
      "#{page_tittle} | #{base_tittle}"
    end
  end
end
