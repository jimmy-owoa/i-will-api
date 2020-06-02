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
      render json: @list
    end

    # POST /lists
    def create
      @list = List.new(list_params)

      if @list.save
        render json: @list, status: :created, location: @list
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

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_list
        @list = List.friendly.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def list_params
        params.require(:list).permit(:name, :start_date, :end_date, :description, :code, :slug, :user_id)
      end
  end
end