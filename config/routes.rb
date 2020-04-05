Rails.application.routes.draw do
  resource :hello_world, only: :show

  get 'multithreading/threads', to: 'multithreading#threads'
  get 'multithreading/fibers', to: 'multithreading#fibers'
end
