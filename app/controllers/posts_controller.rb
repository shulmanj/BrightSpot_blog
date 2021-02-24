class PostsController < ApplicationController

    # List of all posts
    def index
        @posts = Post.all
    end

    # Calls show.html.erb file
    def show
        @post = Post.find(params[:id])
    end

    # New post
    def new
        @post = Post.new
    end

    # Create new post
    def create
        @post = Post.new(post_params)

        if @post.save
            redirect_to @post
        else
            render :new
        end
    end
    
    private
        # Attributes of post
        def post_params
            params.require(:post).permit(:title, :body)
        end
end