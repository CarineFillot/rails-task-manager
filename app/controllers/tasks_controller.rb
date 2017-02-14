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
    Task.create(tasks_params)
    redirect_to_tasks_path
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(params[:task])

  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
  end

private

  def set_task
    @task = Task.find(params[:id])
  end

  def tasks_params
    params.require(:task).permit(:name, :content, :deadline)
  end

end
