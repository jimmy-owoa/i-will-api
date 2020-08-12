module Api::V1
  class GroupsController < ApiController
    before_action :set_group, only: [:show, :update, :destroy]

    # GET /groups
    def index

    end

    # GET /groups/1
    def show

    end

    # POST /groups
    def create

    end

    # PATCH/PUT /groups/1
    def update

    end

    # DELETE /groups/1
    def destroy

    end

    def get_regions
      regions = Region.pluck(:id, :name).map{ |id, name| { id: id, name: name }}

      render json: { status: "ok", regions: regions}, status: :ok
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_group
        @group = Group.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def group_params
        params.require(:group).permit(:name, :description, :address, :commune_id, :image)
      end
  end
end