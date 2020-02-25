class HelloWorldsController < ApplicationController
  def show
    result = HelloWorld::Operation::Show.call(params: params)
    if result.success?
      render json: result[:model].to_json
    else
      head :not_found
    end
  end
end
