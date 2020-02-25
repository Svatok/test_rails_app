Rails.application.routes.draw do
  resource :hello_world, only: :show
end
