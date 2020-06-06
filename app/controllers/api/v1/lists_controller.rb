module Api::V1
  class ListsController < ApiController
    before_action :set_list, only: [:show, :update, :destroy]

    # GET /lists
    def index
      lists = List.as_list_json

      render json: lists
    end

    # GET /lists/1
    def show
      render json: @list.as_show_json(@current_user)
    end

    # POST /lists
    def create
      @list = List.new(list_params)

      if @list.save
        params[:tasks].each do |task|
          task_type_id = TaskType.where(name: task[:task_type_name]).first_or_create.id
          measure_unit_id = MeasureUnit.where(name: task[:measure_unit_name]).first_or_create.id 
          Task.create(name: task[:name], amount: task[:amount], is_multiple: task[:is_multiple], task_type_id: task_type_id, measure_unit_id: measure_unit_id, list_id: @list.id)
        end
        render json: @list, status: :created
      else
        render json: @list.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /lists/1
    def update
      if @list.update(list_params)
        render json: @list
      else
        render json: @list.errors, status: :unprocessable_entity
      end
    end

    # DELETE /lists/1
    def destroy
      @list.destroy
    end

    def get_lists
      lists = List.pluck(:id, :name).map{ |id, name| { name: name, id: id} }
      render json: lists, status: 200
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_list
        @list = List.friendly.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def list_params
        params.require(:list).permit(:name, :start_date, :end_date, :description, :code, :slug, :user_id, tasks: [:name, :amount, :measure_unit_name, :task_type_name, :is_multiple])
      end
  end
end