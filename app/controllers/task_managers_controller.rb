class TaskManagersController < ApplicationController
  before_action :set_task_manager, only: %i[show edit update destroy]

  # GET /task_managers
  def index
    @task_managers = TaskManager.all
    @total_task_managers = TaskManager.count
    @completed_task_managers = TaskManager.where(status: 'completed').count
    @pending_task_managers = TaskManager.where(status: 'to_do').count
  end

  # GET /task_managers/:id
  def show
  end

  # GET /task_managers/new
  def new
    @task_manager = TaskManager.new
  end

  # POST /task_managers
  def create
    @task_manager = TaskManager.new(task_manager_params)
    if @task_manager.save!
      @task_managers = TaskManager.count
      respond_to do |format|
        format.turbo_stream
      end
    end
  end

  # GET /task_managers/:id/edit
  def edit
  end

  # PATCH/PUT /task_managers/:id
  def update
    if @task_manager.update(task_manager_params)
      respond_to do |format|
        format.html { redirect_to @task_manager, notice: 'Task Manager was successfully updated.' }
        format.turbo_stream
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /task_managers/:id
  def destroy
    @task_manager.destroy
    respond_to do |format|
      format.turbo_stream
    end
  end

  private

  def set_task_manager
    @task_manager = TaskManager.find(params[:id])
  end

  def task_manager_params
    params.require(:task_manager).permit(:title, :description, :status)
  end
end