module MessagesHelper
  def nested_messages(messages)
  	content_tag :div do
	    messages.map do |message, sub_messages|
	      	render(message) + nested_messages(sub_messages)
	  end.join
    end.html_safe
  end
end