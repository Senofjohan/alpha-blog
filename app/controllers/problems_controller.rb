class ProblemsController < ApplicationController

  def new
    @problem = Problem.new

  end

  def create
    render plain: params[:problem].inspect
    @problem = Problem.new(problem_params)
    @problem.save
    redirect_to problems_show(@problem)
  end

  private
    def problem_params
      params.require(:problem).permit(:title, :description)
    end
end
