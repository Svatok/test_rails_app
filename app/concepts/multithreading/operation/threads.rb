module Multithreading::Operation
  class Threads < Trailblazer::Operation
    step :generate_threads
    step :wait_for_threads_finish

    DEFAULT_COUNT = 100
    DEFAULT_SLEEP = 1

    def generate_threads(ctx, params:, **)
      ctx[:models] = []
      (params[:count].to_i || DEFAULT_COUNT).times do
        ctx[:models] << Thread.new { sleep(params[:sleep].to_f || DEFAULT_SLEEP) }
      end
    end

    def wait_for_threads_finish(ctx, models:, **)
      models.each do |thread|
        thread.join
      end
    end
  end
end
