class MultithreadingController < ApplicationController
  def threads
    Multithreading::Operation::Threads.call(params: params)

    render json: {}, status: 200
  end

  def fibers
    Multithreading::Operation::Fibers.call(params: params)

    render json: {}, status: 200
  end
end
