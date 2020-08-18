module Multithreading::Lib
  module PerformAction
    DEFAULT_SLEEP = 1
    DEFAULT_ACTION = 'sleep'

    def thread_action(params)
      send("#{params[:custom_action] || DEFAULT_ACTION}_action", params)
    end

    def sleep_action(params)
      sleep(params[:sleep].to_f || DEFAULT_SLEEP)
    end

    def counting_action(params)
      2**1_000_000
    end
  end
end
