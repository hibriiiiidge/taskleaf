class TasksController < ApplicationController

  before_action :set_task, only: %i[show edit update destroy]

  def index
    @tasks = Task.all
  end

  def show
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to root_path, notice: "「#{@task.name}」を追加しました。"
    else
      flash.now[:alert] = "タスクの作成が失敗しました。もう一度やり直してください。"
      render :new
    end
  end

  def edit
  end

  def update
    if @task.update(task_params)
      redirect_to root_path, notice: "「#{@task.name}」を更新しました。"
    else
      flash.now[:alert] = "タスクの更新が失敗しました。もう一度やり直してください。"
      render :edit
    end
  end

  def destroy
    @task.destroy!
    redirect_to root_path, notice: "「#{@task.name}」を削除しました。"
  end

  private

  def task_params
    params.require(:task).permit(:name, :description)
  end

  def set_task
    @task = Task.find(params[:id])
  end

end
