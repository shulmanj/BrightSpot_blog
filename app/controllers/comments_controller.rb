class CommentsController < ApplicationController
    # Create new comment
    def create
        @post = Post.find(params[:post_id])
        @comment = @post.comments.create(comment_params)
        redirect_to post_path(@post)
    end

    # Delete comment
    def destroy
        @post = Post.find(params[:post_id])
        @comment = @post.comments.find(params[:id])
        @comment.destroy
        redirect_to post_path(@post)
    end

    private
    # Attributes of comments
    def comment_params
        params.require(:comment).permit(:name, :body)
    end
end
