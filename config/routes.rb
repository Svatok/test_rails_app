Rails.application.routes.draw do
  resource :hello_world, only: :show

  get 'multithreading/threads', to: 'multithreading#threads'
  get 'multithreading/fibers', to: 'multithreading#fibers'
  get 'multithreading/processes', to: 'multithreading#processes'
  get 'multithreading/concurrent_threads', to: 'multithreading#concurrent_threads'
end
