class EventAnswersController < ApplicationController
  before_action :set_event_answer, only: [:show, :edit, :update, :destroy]
  before_action :load_event_parts, only: [:edit, :new]

  # GET /event_answers
  # GET /event_answers.json
  def index
    @event_answers = EventAnswer.all
  end

  # GET /event_answers/1
  # GET /event_answers/1.json
  def show
  end

  # GET /event_answers/new
  def new
    @event_answer = EventAnswer.new
  end

  # GET /event_answers/1/edit
  def edit
  end

  # POST /event_answers
  # POST /event_answers.json
  def create
    @event_answer = EventAnswer.new(event_answer_params)

    respond_to do |format|
      if @event_answer.save
        format.html { redirect_to @event_answer, notice: 'Event answer was successfully created.' }
        format.json { render :show, status: :created, location: @event_answer }
      else
        format.html { render :new }
        format.json { render json: @event_answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /event_answers/1
  # PATCH/PUT /event_answers/1.json
  def update
    respond_to do |format|
      if @event_answer.update(event_answer_params)
        format.html { redirect_to @event_answer, notice: 'Event answer was successfully updated.' }
        format.json { render :show, status: :ok, location: @event_answer }
      else
        format.html { render :edit }
        format.json { render json: @event_answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /event_answers/1
  # DELETE /event_answers/1.json
  def destroy
    @event_answer.destroy
    respond_to do |format|
      format.html { redirect_to event_answers_url, notice: 'Event answer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event_answer
      @event_answer = EventAnswer.find(params[:id])
    end

    def load_event_parts
      @event_parts = EventPart.all
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_answer_params
      params.require(:event_answer).permit(:answer, :next_type, :next_id, :event_part_id)
    end
end
