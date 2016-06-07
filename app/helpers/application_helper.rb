module ApplicationHelper
    
    # Returns the full title on a per-page basis.
  def full_title(page_title = '')
    base_title = "Home Server"
    title = "Workspace"
    if page_title.empty?
      title
    else
      page_title + " | " + base_title
    end
  end
end
