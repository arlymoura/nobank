module ApplicationHelper
  def current_class?(test_path)
    current_page?(test_path) ? "is-active" : ""
  end
end
