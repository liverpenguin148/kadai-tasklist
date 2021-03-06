class TasksController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only:[:show,:edit,:update,:destroy]

  def index
    @tasks = current_user.tasks.order(id: :asc).page(params[:page]).per(5)
  end
  
  def show
  end
  
  def new
    @task = current_user.tasks.new
  end
  
  def create
    @task= current_user.tasks.new(task_param)
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
  
  
  def correct_user
    @task= current_user.tasks.find_by(id: params[:id])
    unless @task
      redirect_to root_url
    end
  end
end
