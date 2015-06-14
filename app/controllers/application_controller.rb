class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :load_scene, only: [:scene, :index]
  before_action :check_event, only: [:scene]
  before_action :load_event, only: [:event]

  def index
  end

  def scene
    respond_to_js
  end

  def event
    respond_to_js
  end

  private

    def load_event
      @event_part = params[:event_id].present? ? Event.find(params[:event_id]).start_event_part : EventPart.find(params[:event_part_id])
    end

    def load_scene
      @scene = Scene.find_by_id(params[:scene_id]) || Scene.first
    end

    def check_event
      event = Events::EventChecker.new(@scene).call
      redirect_to action: :event, format: 'js', event_id: event.id if event
    end

    def respond_to_js
      respond_to { |format| format.js }
    end
end
