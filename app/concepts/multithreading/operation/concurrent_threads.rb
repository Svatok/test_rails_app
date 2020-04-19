module Multithreading::Operation
  class ConcurrentThreads < Base
    step :generate_threads

    DEFAULT_COUNT = 10

    def generate_threads(ctx, params:, **)
      ctx[:model] = Concurrent::CachedThreadPool.new
      (params[:count].to_i || DEFAULT_COUNT).times do
        ctx[:model].post do
          thread_action(params)
        end
      end
    end
  end
end
