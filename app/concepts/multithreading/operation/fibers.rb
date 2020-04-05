module Multithreading::Operation
  class Fibers < Trailblazer::Operation
    step :generate_fibers

    DEFAULT_COUNT = 100
    DEFAULT_SLEEP = 1

    def generate_fibers(ctx, params:, **)
      ctx[:models] = []
      (params[:count].to_i || DEFAULT_COUNT).times do
        Fiber.new do
          sleep(params[:sleep].to_f || DEFAULT_SLEEP)
          Fiber.yield
        end
      end
    end
  end
end
