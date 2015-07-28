class CoursesController < ApplicationController
  before_action :authenticate_user!

  def index
    @courses = current_user.courses.active.latest.paginate page: params[:page],
      per_page: 10
  end

  def show
    @course = Course.find params[:id]
    @course_subjects = @course.user_subjects
    @supervisors = @course.users.supervisors
    @subjects = @course.subjects
    @activities = @course.activities
  end
end
