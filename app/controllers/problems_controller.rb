class ProblemsController < ApplicationController

  def new
    @problem = Problem.new

  end

  def create
    #render plain: params[:problem].inspect
    #@problem = Problem.new(problem_params)
    #@problem.save
    #redirect_to problems_show(@problem)
    @problem = Problem.new(problem_params)
    if @problem.save
      #do something
      flash[:notice] = "Problem was successfully created"
      redirect_to problem_path(@problem)
    else 
      render 'new'

    end
  end

  def show
    @problem = Problem.find(params[:id])
  end

  private
    def problem_params
      params.require(:problem).permit(:title, :description)
    end
end
