module Api::V1
  class TasksController < ApiController
    before_action :authenticate_cookie
    before_action :set_task, only: [:show, :update, :destroy]

    # GET /tasks
    def index
      @tasks = Task.all

      render json: @tasks
    end

    # GET /tasks/1
    def show
      render json: @task
    end

    # POST /tasks
    def create
      @task = Task.new(task_params)
      
      @task.task_type_id = TaskType.where(name: params[:task_type_name]).first_or_create.id
      @task.measure_unit_id = MeasureUnit.where(name: params[:measure_unit_name]).first_or_create.id 

      if @task.save
        render json: @task, status: :created
      else
        render json: @task.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /tasks/1
    def update
      if @task.update(task_params)
        render json: @task
      else
        render json: @task.errors, status: :unprocessable_entity
      end
    end

    # DELETE /tasks/1
    def destroy
      @task.destroy
    end

    def add_task_to_user
      task = Task.find(params[:task_id])
      value_task = !params[:value]

      # binding.pry
      if value_task
        @current_user.tasks << task
      else
        @current_user.tasks.delete(task)
      end
      
      render json: @current_user.tasks, status: 200
    end
    

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_task
        @task = Task.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def task_params
        params.require(:task).permit(:name, :amount, :is_multiple, :taks_type_id, :measure_unit_id, :list_id, :task_type_name, :measure_unit_name)
      end
  end
end