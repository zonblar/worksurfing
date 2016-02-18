class ReviewsController < ApplicationController
  before_action :find_workspace, only: [ :new, :create ]

  def new
    @review = Review.new
  end

  def create
    @review = @workspace.reviews.build(review_params)
    @review.save
    redirect_to workspace_path(@workspace)
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
  def find_workspace
    @workspace = Workspace.find(params[:workspace_id])
  end
end
