require 'active_support/concern'

module FilmFan::Commentable
  extend ActiveSupport::Concern

  included do
    before_filter :messages, :only => [:show]
  end

  def messages
    @commentable = find_commentable
    @messages = @commentable.messages.arrange(:order => :created_at)
    @message = Message.new
  end

  private

  def find_commentable
    return params[:controller].singularize.classify.constantize.find(params[:id])
  end

end
