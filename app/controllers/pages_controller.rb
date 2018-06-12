class PagesController < ApplicationController

  def index
    render json: {
      status: 200,
      message: "API FUNCIONANDO!"
    }
  end

end
