class HelloWorldsController < ApplicationController
  def show
    result = HelloWorld.find_by(name: params[:name])
    if result
      render json: result.to_json
    else
      head :not_found
    end
  end
end
