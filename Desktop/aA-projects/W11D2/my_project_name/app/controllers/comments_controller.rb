class CommentsController<ApplicationController
    def index
        if params[:comment][:user_id]
            render json: Comment.where("comments.user_id=?",params[:comment][:user_id])
        elsif params[:comment][:artwork_id]
            render json: Comment.where("comments.artwork_id=?",params[:comment][:artwork_id])
        else render json: Comment.all
        end

    end


    def create
        comment=Comment.new(comment_params)
        if comment.save
            render json: comment
        else
            render json: comment.errors.full_messages, status: :unprocessable_entity
        end
    end

    def destroy
        comment=Comment.find(params[:id])
        comment.destroy
        render json: comment
    end


    def comment_params
        params.require(:comment).permit(:user_id,:body,:artwork_id)
    end

end