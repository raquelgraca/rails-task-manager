class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.all
  end

  def show; end

  def new
    @super_task = Task.new
  end

  def create
    @tasks = Task.new(task_params)
    @tasks.save
    redirect_to tasks_path(@tasks)
  end

  def edit; end

  def update
    @tasks.update(task_params)
    redirect_to tasks_path(@tasks)
  end

  def destroy
    @tasks.destroy
    redirect_to tasks_path
  end

  private

  def set_task
    @tasks = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :details)
  end
end
