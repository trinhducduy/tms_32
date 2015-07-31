class CoursesController < ApplicationController
  before_action :authenticate_user!

  def index
    if params[:action_type] == "search" && params[:q]
      @courses = current_user.courses.search(params[:q]).paginate page: params[:page],
        per_page: 10
      render "courses/search"
    else
      @courses = current_user.courses.active.latest.paginate page: params[:page],
        per_page: 10
      render "courses/index"
    end
  end

  def show
    @course = Course.find params[:id]
    @course_subjects = @course.user_subjects
    @supervisors = @course.users.supervisors
    @subjects = @course.subjects
    @members = @course.users.trainees
    @activities = @course.activities.latest.paginate page: params[:page],
      per_page: 5
    respond_to do |format|
      format.html
      format.js {render "shared/activities"}
    end
  end

  private
  def search
  end
end
