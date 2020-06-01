module ApplicationHelper
  def current_class?(test_path)
    current_page?(test_path) ? "is-active" : ""
  end
  def formated_date(date)
    date.strftime("%d/%m/%Y as %H:%M")  
  end
end
