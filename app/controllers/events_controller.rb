# frozen_string_literal: true

class EventsController < ApplicationController
  before_action :set_event, only: %i[show edit update destroy]
  before_action :set_filters, only: :index
  has_scope :with_genres, type: :array
  has_scope :without_genres, type: :array
  has_scope :with_past_date

  # GET /events
  # GET /events.json
  def index
    @events = apply_scopes(Event).decorate.group_by(&:date)
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @event = @event.decorate
  end

  # GET /events/new
  def new
    @event = Event.new
    @event.build_address
  end

  # GET /events/1/edit
  def edit; end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_event
    @event = Event.find(params[:id])
  end

  def set_filters
    if current_user && params[:commit].blank? && params[:with_genres].blank? && params[:without_genres].blank?
      params[:without_genres] = current_user.genre_ids
    end
  end

  # Only allow a list of trusted parameters through.
  def event_params
    params.require(:event).permit(
        :name,
        :event_type,
        :date,
        artist_ids: [],
        genre_ids: [],
        address_attributes: %i[
        id
        street
        city
        state
        zip
      ]
    )
  end
end
