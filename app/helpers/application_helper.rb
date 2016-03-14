module ApplicationHelper
  def action_button_caption( object )
    if controller.action_name == "new"
       return "Add " + object
    elsif controller.action_name == "edit"
       return "Update " + object
    else
       return "Submit " + object
    end
  end
end
