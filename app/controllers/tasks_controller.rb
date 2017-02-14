class TasksController < ApplicationController


  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])        #
  end

  def new
    @task = Task.new(params[:task])
    @task.save
  end

  def create
    Task.create(user_params)
    redirect_to tasks_path
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(user_params)
    redirect_to tasks_path
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
  end

private

  def set_task
    @task = Task.find(params[:id])
  end

  def user_params
    params.require(:task).permit(:name, :content, :deadline)
  end

end
