class TransfersController < ApplicationController

  before_action :set_transfer, only: [:show, :update, :destroy]

  # GET /transfers
  def index
    @transfers = Transfer.all
    render json: @transfers
  end

  # GET /transfers/1
  def show
    render json: @transfer
  end

  # POST /transfers
  def create
    @transfer = Transfer.new(transfer_params)
    if @transfer.save
      render json: @transfer, status: :created, location: @transfer
    else
      render json: @transfer.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /transfers/1
  def update
    if @transfer.update(transfer_params)
      render json: @transfer
    else
      render json: @transfer.errors, status: :unprocessable_entity
    end
  end

  # DELETE /transfers/1
  def destroy
    @transfer.destroy
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_transfer
    @transfer = Transfer.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def transfer_params
    params.require(:transfer).permit(:category, :amount, :token, :account_transfer_id, :account_id, :reverse)
  end
end
