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
    @task = Task.new(task_params)
    
    if @task.save
      flash[:success] = 'Taskが追加されました'
      redirect_to @task
    else
      flash.now[:danger] = 'Taskが追加されませんでした'
      render :new
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
        @task = Task.find(params[:id])

    if @task.update(task_params)
      flash[:success] = 'Taskが追加されました'
      redirect_to @message
    else
      flash.now[:danger] = 'Taskが追加されませんでした'
      render :edit
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    
    flash[:success] = 'Taskは削除されました'
    redirect_to task_url
  end
  
  # Strong Parameter
  def task_params
    params.require(:task).permit(:content)
  end
end
