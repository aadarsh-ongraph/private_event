class EventsController < ApplicationController
    before_action :set_event, only: [:show, :edit, :update, :destroy]
  
    def index
      @events = Event.all
    end
  
    def show
    end
  
    def new
      @event = Event.new
    end
  
    def create
     
        Event.create(title:params[:event][:title], date:params[:event][:date], location:params[:event][:location], description:params[:event][:description], user_id:params[:event][:user_id])
        redirect_to events_path
    # @event = current_user.events.build(event_params)
    #   if @event.save
    #     redirect_to @event, notice: 'Event was successfully created.'
    #   else
    #     render :new
    #   end
    end
  
    def edit
    end
  
    def update
      if @event.update(event_params)
        redirect_to @event, notice: 'Event was successfully updated.'
      else
        render :edit
      end
    end
  
    def destroy
      @event.destroy
      redirect_to events_url, notice: 'Event was successfully destroyed.'
    end
  
    private
  
    def set_event
      @event = Event.find(params[:id])
    end
  
    def event_params
      params.require(:event).permit(:title, :date, :location, :description)
    end

  end
  