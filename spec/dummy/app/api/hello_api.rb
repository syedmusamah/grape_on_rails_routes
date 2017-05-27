class HelloApi < Grape::API
  desc 'Hello World!'
  get :hello do
    { hello: 'world' }
  end
end
