class TasksController < ApplicationController
  
  def index
    @tasks = Task.all
  end
  
  def show
    @task = Task.find(params[:id])
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
    @task = Task.find(params[:id])
  end
  
  def update
    @task = Task.new(task_param)
    if @task.save
      flash[:success] = 'タスクの登録が完了しました'
      redirect_to @task
    else
      flash[:danger] = 'タスクの登録に失敗しました'
      render :edit
    end
  end
  
  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    
    flash[:success] = 'タスクを削除しました'
    redirect_to tasks_url
  end
  
  
  private
  def task_param
    params.require(:task).permit(:content)
  end
end
