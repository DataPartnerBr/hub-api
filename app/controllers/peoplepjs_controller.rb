class PeoplepjsController < ApplicationController

  before_action :set_peoplepj, only: [:show, :update, :destroy]

  # GET /peoplepjs/
  def index
    @peoplepjs = PeoplePj.all
    render json: @peoplepjs
  end

  # GET /peoplepj/1
  def show
    render json: @peoplepj
  end

  # POST /peoplepj
  def create
    @peoplepjscreate = PeoplePj.new(peoplepj_params)

    if @peoplepjscreate.save
      render json: @peoplepjscreate, status: :created, location: @peoplepjs
    else
      render json: @peoplepjscreate.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /peoplepjs/1
  def update
    if @peoplepj.update(peoplepj_params)
      render json: @peoplepj
    else
      render json: @peoplepj.errors, status: :unprocessable_entity
    end
  end

  # DELETE /peoplepj/1
  def destroy
    @peoplepj.destroy
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_peoplepj
    @peoplepj = peoplepj.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def peoplepj_params
    params.require(:peoplepj).permit(:cnpj, :bussiness_name, :fantasy_name)
  end
end
