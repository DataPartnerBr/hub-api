class AccountsController < ApplicationController
  before_action :set_account, only: [:show, :update, :destroy]

  # GET /accounts
  def index
    @accounts = Account.all
    render json: @accounts
  end

  # GET /accounts/1
  def show
    render json: @account
  end

  # GET /matrix
  def matrix
    @matrix = Account.where("id in (select accounts_id from accounts)")
    render json: @matrix
  end

  # GET /branch
  def branch
    @branch = Account.where(accounts_id: params[:id])
    render json: @branch
  end


  # POST /accounts
  def create
    @account = Account.new(account_params)

    if @account.save
      if @account.is_branch? == false
        @account.accounts_id = Account.last.id
        @account.save
      end
      render json: @account, status: :created, location: @account
    else
      render json: {message: "Validation failed", errors: @account.errors}, status: 400
    end
  end

  # PATCH/PUT /accounts/1
  def update
    if @account.update(account_params)
      render json: @account
    else
      render json: @account.errors, status: :unprocessable_entity
    end
  end

  # DELETE /accounts/1
  def destroy
    @account.destroy
    render nothing: true, status: 204

  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_account
    @account = Account.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def account_params
    params.require(:account).permit(:name, :is_branch, :status, :accounts_id, :people_pjs_id, :people_pfs_id, :balance)
  end
end
