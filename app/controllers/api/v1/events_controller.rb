module Api::V1
  class EventsController < ApiController
    before_action :set_event, only: [:show, :update, :destroy]

    # GET /events
    def index

    end

    # GET /events/1
    def show

    end

    # POST /events
    def create

    end

    # PATCH/PUT /events/1
    def update

    end

    # DELETE /events/1
    def destroy

    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_event
        @event = Event.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def event_params
        params.require(:event).permit(:name, :description, :address, :quotes, :starts_at, :ends_at, :commune_id, :group_id,:image)
      end
  end
end