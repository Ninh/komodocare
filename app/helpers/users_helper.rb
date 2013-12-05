module UsersHelper
	def gravatar_for(user, options = { :size => 50 })
    	gravatar_image_tag(user.email.downcase, :alt => h(user.full_name),
                                            :class => 'gravatar',
                                            :gravatar => options)
  end
  def gravatar_small_for(user, options = { :size => 30 })
    	gravatar_image_tag(user.email.downcase, :alt => h(user.full_name),
                                            :class => 'gravatar',
                                            :gravatar => options)
  end
  def gravatar_large_for(user, options = { :size => 120 })
    	gravatar_image_tag(user.email.downcase, :alt => h(user.full_name),
                                            :class => 'gravatar',
                                            :gravatar => options)
  end
end
