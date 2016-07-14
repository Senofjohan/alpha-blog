class ProblemsController < ApplicationController

  def index
    @problems = Problem.all
  end

  def new
    @problem = Problem.new
  end

  def edit
    @problem = Problem.find(params[:id])
  end

  def create
    @problem = Problem.new(problem_params)
    if @problem.save
      #do something
      flash[:notice] = "Problem was brought into awareness... and our database"
      redirect_to problem_path(@problem)
    else 
      render 'new'
    end
  end

  def update
    @problem = Problem.find(params[:id])
    if @problem.update(problem_params)
      flash[:notice] = "Problem was successfully updated"
      redirect_to problem_path(@problem)
    else
      render 'edit'
    end
  end

  def show
    @problem = Problem.find(params[:id])
  end


  def destroy
    @problem = Problem.find(params[:id])
    @problem.destroy
    flash[:notice] = "The problem is no longer a problem"
    redirect_to problems_path
  end

  private
    #white lists problems class
    def problem_params
      params.require(:problem).permit(:title, :description)
    end
end
