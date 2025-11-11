class CommentsController < ApplicationController
  def create
    @prototype = Prototype.find(params[:prototype_id])
    @comment = @prototype.comments.new(comment_params)

    if @comment.save
      # 保存に成功した場合は詳細ページにリダイレクト
      redirect_to prototype_path(@prototype)
    else
      # 保存に失敗した場合は詳細ページに戻す
      @comments = @prototype.comments
      render "prototypes/show", status: :unprocessable_entity
    end
  end

  private

  def comment_params
    params.require(:comment)
          .permit(:content)
          .merge(user_id: current_user.id)
  end
end
