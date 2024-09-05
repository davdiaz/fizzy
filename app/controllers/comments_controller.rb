class CommentsController < ApplicationController
  before_action :set_bubble

  def create
    @bubble.comments.create!(comment_params)
    redirect_to @bubble
  end

  private
    def comment_params
      params.require(:comment).permit(:body)
    end

    def set_bubble
      @bubble = Bubble.find(params[:bubble_id])
    end
end
