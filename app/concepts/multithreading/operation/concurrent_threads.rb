module Multithreading::Operation
  class ConcurrentThreads < Trailblazer::Operation
    step :generate_threads

    DEFAULT_COUNT = 10
    DEFAULT_SLEEP = 1

    def generate_threads(ctx, params:, **)
      ctx[:model] = Concurrent::CachedThreadPool.new
      (params[:count].to_i || DEFAULT_COUNT).times do
        ctx[:model].post do
          sleep(params[:sleep].to_f || DEFAULT_SLEEP)
        end
      end
    end
  end
end
