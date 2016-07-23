class ProblemsController < ApplicationController
  before_action :set_problem, only: [:edit, :update, :show, :destroy]
  before_action :require_user, except: [:index, :show]
  before_action :require_same_user, only: [:edit, :update, :destroy]

  def index
    @problems = Problem.paginate(page: params[:page], per_page: 5)
  end

  def new
    @problem = Problem.new
  end

  def edit
  end

  def create
    @problem = Problem.new(problem_params)
    @problem.user = User.first
    if @problem.save
      #do something
      flash[:success] = "Problem was brought into awareness... and our database"
      redirect_to problem_path(@problem)
    else 
      render 'new'
    end
  end

  def update
    if @problem.update(problem_params)
      flash[:success] = "Problem was successfully updated"
      redirect_to problem_path(@problem)
    else
      render 'edit'
    end
  end

  def show
  end


  def destroy
    @problem.destroy
    flash[:danger] = "The problem is no longer a problem"
    redirect_to problems_path
  end

  private
    def set_problem
      @problem = Problem.find(params[:id])
    end
    #white lists problems class
    def problem_params
      params.require(:problem).permit(:title, :description)
    end

    def require_same_user
      if current_user != @problem.user
        flash[:danger] = "You can only edit or delete your own problems"
      end
    end
end
