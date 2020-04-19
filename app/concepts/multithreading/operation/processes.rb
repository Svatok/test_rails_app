module Multithreading::Operation
  class Processes < Base
    step :generate_processes
    step :wait_for_processes_finish

    DEFAULT_COUNT = 100

    def generate_processes(ctx, params:, **)
      (params[:count].to_i || DEFAULT_COUNT).times do
        fork { thread_action(params) }
      end
    end

    def wait_for_processes_finish(ctx, params:, **)
      Process.waitall if params[:wait_finish] == 'true'
    end
  end
end
