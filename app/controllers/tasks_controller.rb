class TasksController < ApplicationController
   before_action :set_task, only: [:show, :edit, :update, :destroy]

  # GET /tasks
  # GET /tasks.json
  def index
   # @tasks = Task.all
    params[:project_id] ? @tasks = Task.where(:project_id => params[:project_id]) : @tasks = Task.all
    params[:status] ? @tasks = Task.where(:status => params[:status]) : @tasks
    if params[:project_id] && params[:status]
      @tasks = Task.where(:project_id => params[:project_id],:status => params[:status] )
    else
      @tasks
    end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
    @task = Task.find(params[:id])
  end

  # GET /tasks/new
  def new
    @task = Task.new
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.new(task_params)
    if params[:doc]
      uploaded_io = params[:doc]
      @task.doc = uploaded_io.original_filename
      @task.doc_id =String( @task.doc.__id__)
      Dir.mkdir Rails.root.join('public', 'uploads') unless File.exists?(Rails.root.join('public', 'uploads'))
      File.open(Rails.root.join('public', 'uploads', @task.doc_id), 'wb') do |file|
        file.write(uploaded_io.read)
      end
    else
      @task.doc = ""
      @task.doc_id = ""
    end
    respond_to do |format|
      if @task.save
        format.html { redirect_to @task, notice: 'Task was successfully created.' }
        format.json { render action: 'show', status: :created, location: @task }
      else
        format.html { render action: 'new' }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end

  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    respond_to do |format|
      if params[:doc]
         if @task.doc != ""
           File.delete(Rails.root.join('public', 'uploads',@task.doc_id))
         end
        uploaded_io = params[:doc]
        @task.doc = uploaded_io.original_filename
        @task.doc_id =String( @task.doc.__id__)
        File.open(Rails.root.join('public', 'uploads', @task.doc_id), 'wb') do |file|
          file.write(uploaded_io.read)
        end
      end

      if  @task.update(task_params)
        format.html { redirect_to @task, notice: 'Task was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    if @task.doc != ""
      File.delete(Rails.root.join('public', 'uploads',@task.doc_id))
    end
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_url }
      format.json { head :no_content }
    end
  end
end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      if params[:doc]
        params.require(:task).permit(:title, :priority, :description, :status, :due_date, :creation_date ,:project_name, :project_id, :assignee, :user_id, :doc)
      else
        params.require(:task).permit(:title, :priority, :description, :status, :due_date, :creation_date ,:project_name, :project_id, :assignee, :user_id)
      end

    end

  end


