module ApplicationHelper
  def body_class
    "#{controller_name} #{controller_name}_#{action_name}"
  end
end
