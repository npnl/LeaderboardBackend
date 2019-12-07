class SubmissionsController < ApplicationController
  # before_action :set_submission, only: [:show, :edit, :update, :destroy]

  def index
    submissions = Submission.where(user: @current_user)
    render json: submissions.as_json, status: :ok
  end

  def create
    submission = Submission.new(submission_params)
    submission.user = @current_user
    if submission.valid? && submission.save
      render json: submission.as_json, status: :created
    else
      render json: { errors: submission.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def leaderboard
    groups = Group.all
    groups = groups.select {|group| !group.best_submission.nil?}
    groups = groups.sort_by {|group| -group.best_submission.score}
    render json: groups.as_json, status: :ok
  end


  def destroy
    @submission.destroy
    respond_to do |format|
      format.html { redirect_to submissions_url, notice: 'Submission was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_submission
      @submission = Submission.find(params[:id])
    end

  def submission_params
    params.require(:submission).permit(:score)
  end
end
