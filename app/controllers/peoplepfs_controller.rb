class PeoplepfsController < ApplicationController

  before_action :set_peoplepf, only: [:show, :update, :destroy]

  # GET /peoplepfs/
  def index
    @peoplepfs = PeoplePf.all
    render json: @peoplepfs
  end

  # GET /peoplepf/1
  def show
    render json: @peoplepf
  end

  # POST /peoplepf
  def create
    @peoplepfscreate = PeoplePf.new(peoplepf_params)

    if @peoplepfscreate.save
      render json: @peoplepfscreate, status: :created, location: @peoplepfs
    else
      render json: @peoplepfscreate.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /peoplepfs/1
  def update
    if @peoplepf.update(peoplepf_params)
      render json: @peoplepf
    else
      render json: @peoplepf.errors, status: :unprocessable_entity
    end
  end

  # DELETE /peoplepf/1
  def destroy
    @peoplepf.destroy
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_peoplepf
    @peoplepf = peoplepf.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def peoplepf_params
    params.require(:peoplepf).permit(:cpf, :full_name, :born_at)
  end
end
