module Multithreading::Operation
  class Processes < Trailblazer::Operation
    step :generate_processes
    step :wait_for_processes_finish

    DEFAULT_COUNT = 100
    DEFAULT_SLEEP = 1

    def generate_processes(ctx, params:, **)
      (params[:count].to_i || DEFAULT_COUNT).times do
        fork { sleep(params[:sleep].to_f || DEFAULT_SLEEP) }
      end
    end

    def wait_for_processes_finish(ctx, params:, **)
      Process.waitall if params[:wait_finish] == 'true'
    end
  end
end
