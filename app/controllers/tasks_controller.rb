class TasksController < ApplicationController
  before_action :set_task,only: [:show, :edit , :update , :destroy]
  
  def index
    @tasks = Task.all
  end
  
  def show
  end
  
  def new
    @task = Task.new
  end
  
  def create
    @task= Task.new(task_param)
    if @task.save
      flash[:success] = 'タスクの登録が完了しました'
      redirect_to tasks_url
    else
      flash[:danger] = 'タスクの登録に失敗しました'
      render :new
    end
  end
  
  def edit
  end
  
  def update
    if @task.update(task_param)
      flash[:success] = 'タスクの登録が完了しました'
      redirect_to @task
    else
      flash[:danger] = 'タスクの登録に失敗しました'
      render :edit
    end
  end
  
  def destroy
    @task.destroy
    
    flash[:success] = 'タスクを削除しました'
    redirect_to tasks_url
  end
  
  
  private
  def task_param
    params.require(:task).permit(:content , :status)
  end
  
  def set_task
    @task = Task.find(params[:id])
  end
end
