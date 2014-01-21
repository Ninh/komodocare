module MessagesHelper
  def nested_messages(messages)
  	content_tag :div do
	    messages.map do |message, sub_messages|
	      	render(message) + nested_messages(sub_messages)
	  end.join
    end.html_safe
  end

  #I believe the below is according to RailsCast, it should be the same
  #def nested_messages(messages)
  #  messages.map do |message, sub_messages|
  #    content_tag(:div, render(message), :class => "media")
  #  end.join.html_safe
  #end
end