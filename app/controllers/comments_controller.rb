class CommentsController < ApplicationController

  before_action :find_gallery

  def create
    @comment = @gallery.comments.create(params[:comment].permit(:content))
    @comment.user_id = current_user.id
    @comment.save

    if @comment.save
     redirect_to(controller: 'public', :action => 'galleries', gallery_id: @gallery.id)
      # redirect_to gallery_path(@gallery)
      # redirect_to url_for(:controller => :public :action => :action_name)

    else
      render 'new'
    end
  end

  private

  def find_gallery
    @gallery = Gallery.find(params[:gallery_id])
end

end
