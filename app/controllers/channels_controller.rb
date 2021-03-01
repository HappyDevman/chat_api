class ChannelsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_channel, only: %i[show update destroy]

  # GET /channels
  # GET /channels.json
  def index
    @channels = Channel.all
  end

  # GET /channels/1
  # GET /channels/1.json
  def show; end

  # POST /channels
  # POST /channels.json
  def create
    @channel = channel_scope.new(channel_params)

    if @channel.save
      render :show, status: :created, location: @channel
    else
      render json: @channel.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /channels/1
  # PATCH/PUT /channels/1.json
  def update
    if @channel.update(channel_params)
      render :show, status: :ok, location: @channel
    else
      render json: @channel.errors, status: :unprocessable_entity
    end
  end

  # DELETE /channels/1
  # DELETE /channels/1.json
  def destroy
    @channel.destroy
  end

  private

  def set_channel
    @channel = Channel.find(params[:id])
  end

  def channel_scope
    current_user.channels
  end

  def channel_params
    params.require(:channel).permit(:name)
  end
end
