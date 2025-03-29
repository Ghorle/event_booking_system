class EventsController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_event_organizer, only: [:create, :update]

  def index
    @events = Event.all
    render json: @events
  end

  def create
    @event = current_user.event_organizer.events.new(event_params)
    if @event.save
      render json: @event, status: :created
    else
      render json: @event.errors, status: :unprocessable_entity
    end
  end

  private

  def event_params
    params.require(:event).permit(:name, :description, :date)
  end

  def authorize_event_organizer
    render json: { error: "Not authorized" }, status: :forbidden unless current_user.organizer?
  end
end
