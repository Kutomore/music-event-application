# frozen_string_literal: true

class ProfilesController < ApplicationController
  before_action :set_profile, only: %i[show edit update destroy]

  # GET /profiles/1
  # GET /profiles/1.json
  def show; end

  # GET /profiles/1/edit
  def edit; end

  # PATCH/PUT /profiles/1
  # PATCH/PUT /profiles/1.json
  def update
    respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to @profile, notice: 'Profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @profile }
      else
        format.html { render :edit }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_profile
    @profile = Profile.find(params[:id]).decorate
  end

  # Only allow a list of trusted parameters through.
  def profile_params
    params.require(:profile).permit(
      :name,
      :birthdate,
      :email,
      :phone,
      :gender,
      :time_zone,
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
