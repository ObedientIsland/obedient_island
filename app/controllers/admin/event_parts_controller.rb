module Admin
  class EventPartsController < AdminController
    before_action :set_event_part, only: [:show, :edit, :update, :destroy]
    before_action :load_events, only: [:edit, :new, :create]

    # GET /event_parts
    # GET /event_parts.json
    def index
      @event_parts = EventPart.includes(:event).all
    end

    # GET /event_parts/1
    # GET /event_parts/1.json
    def show
    end

    # GET /event_parts/new
    def new
      @event_part = EventPart.new
    end

    # GET /event_parts/1/edit
    def edit
    end

    # POST /event_parts
    # POST /event_parts.json
    def create
      @event_part = EventPart.new(event_part_params)

      respond_to do |format|
        if @event_part.save
          format.html { redirect_to @event_part, notice: 'Event part was successfully created.' }
          format.json { render :show, status: :created, location: @event_part }
        else
          format.html { render :new }
          format.json { render json: @event_part.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /event_parts/1
    # PATCH/PUT /event_parts/1.json
    def update
      respond_to do |format|
        if @event_part.update(event_part_params)
          format.html { redirect_to @event_part, notice: 'Event part was successfully updated.' }
          format.json { render :show, status: :ok, location: @event_part }
        else
          format.html { render :edit }
          format.json { render json: @event_part.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /event_parts/1
    # DELETE /event_parts/1.json
    def destroy
      @event_part.destroy
      respond_to do |format|
        format.html { redirect_to event_parts_url, notice: 'Event part was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_event_part
        @event_part = EventPart.find(params[:id])
      end

      def load_events
        @events = Event.all
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def event_part_params
        params.require(:event_part).permit(:name, :title, :text, :next_type, :next_id, :image, :event_id)
      end
  end
end
