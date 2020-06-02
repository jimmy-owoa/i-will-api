module Api::V1
  class MeasureUnitsController < ApiController
    before_action :set_measure_unit, only: [:show, :update, :destroy]

    # GET /measure_units
    def index
      measure_units = MeasureUnit.all.pluck(:name)

      render json: measure_units
    end

    # GET /measure_units/1
    def show
      render json: @measure_unit
    end

    # POST /measure_units
    def create
      @measure_unit = MeasureUnit.new(measure_unit_params)

      if @measure_unit.save
        render json: @measure_unit, status: :created, location: @measure_unit
      else
        render json: @measure_unit.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /measure_units/1
    def update
      if @measure_unit.update(measure_unit_params)
        render json: @measure_unit
      else
        render json: @measure_unit.errors, status: :unprocessable_entity
      end
    end

    # DELETE /measure_units/1
    def destroy
      @measure_unit.destroy
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_measure_unit
        @measure_unit = MeasureUnit.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def measure_unit_params
        params.require(:measure_unit).permit(:name)
      end
  end
end