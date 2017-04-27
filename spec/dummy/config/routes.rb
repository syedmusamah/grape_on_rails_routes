Rails.application.routes.draw do
  mount HelloApi => '/'
  mount StatusesApi => '/statuses'
end
