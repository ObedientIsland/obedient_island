module Admin
  class SceneConnectorsController < AdminController
    before_action :set_scene_connector, only: [:show, :edit, :update, :destroy]
    before_action :load_scenes, only: [:edit, :new]

    # GET /scene_connectors
    # GET /scene_connectors.json
    def index
      @scene_connectors = SceneConnector.includes(:scene_from, :scene_to).all
    end

    # GET /scene_connectors/1
    # GET /scene_connectors/1.json
    def show
    end

    # GET /scene_connectors/new
    def new
      @scene_connector = SceneConnector.new
    end

    # GET /scene_connectors/1/edit
    def edit
    end

    # POST /scene_connectors
    # POST /scene_connectors.json
    def create
      @scene_connector = SceneConnector.new(scene_connector_params)

      respond_to do |format|
        if @scene_connector.save
          format.html { redirect_to @scene_connector, notice: 'Scene connector was successfully created.' }
          format.json { render :show, status: :created, location: @scene_connector }
        else
          format.html { render :new }
          format.json { render json: @scene_connector.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /scene_connectors/1
    # PATCH/PUT /scene_connectors/1.json
    def update
      respond_to do |format|
        if @scene_connector.update(scene_connector_params)
          format.html { redirect_to @scene_connector, notice: 'Scene connector was successfully updated.' }
          format.json { render :show, status: :ok, location: @scene_connector }
        else
          format.html { render :edit }
          format.json { render json: @scene_connector.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /scene_connectors/1
    # DELETE /scene_connectors/1.json
    def destroy
      @scene_connector.destroy
      respond_to do |format|
        format.html { redirect_to scene_connectors_url, notice: 'Scene connector was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_scene_connector
        @scene_connector = SceneConnector.find(params[:id])
      end

      def load_scenes
        @scenes = Scene.all
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def scene_connector_params
        params.require(:scene_connector).permit(:position_x, :position_y, :scene_from_id, :scene_to_id)
      end
  end
end
