class CommentsController < ApplicationController

    layout false 

    before_action :confirm_logged_in

    def create
        @page = Page.find(params[:page_id])
        @comment = @page.comments.create(comment_params)
      #  if @comment.save
      #    flash[:notice] = "Successfully commented..."
      #    redirect_to page_path(@page)
      #  else
      #    flash[:notice] = "Comment failed, try again."
      #    redirect_to page_path(@page) # needs to render something
      #  end
    end

    def destroy
        @page = Page.find(params[:page_id])
        @comment = @page.comments.find(params[:id])
        @comment.destroy
        redirect_to page_path(@page)
    end

    private

    def comment_params
      params.require(:comment).permit(:author, :comment_image, :body).merge(user_id: current_user.id)
    end

end
