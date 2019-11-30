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
    output = []
    @subjects =  @current_user.is_admin ? Subject.all : Subject.where(group: @current_group)
    users = User.all
    if !@users.empty?
      users_groups = @users.group_by { |user| user.group.name }
      # return subject_groups
      users_groups.each do |group_name, users|
        group_output = {group_name: group_name}
        group_subjects = []
        users.each do |subject|
          assessments = Assessment.where(subject_id: subject[:id]).select(:id, :date, :nihss, :fma, :wmft, :sis, :mrs, :mas, :mmt, :barthel, :arm, :moca, :mal, :moca_alternate, :user_id, :comments)
          if !assessments.empty?
            record = {subject_name: subject[:name]}
            record[:assessments] = assessments
            group_subjects.push(record)
          end
        end
        group_output[:subjects] = group_subjects
        output.push(group_output)
      end

    end
    output
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
