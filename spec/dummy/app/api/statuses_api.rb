class StatusesApi < Grape::API
  version 'v1'
  format :json
  prefix :api

  resource :statuses do
    desc 'Return a public timeline.'
    get :public_timeline do
      [{text: "test"}]
    end

    desc 'Return a personal timeline.'
    get :home_timeline do
      [{text: "test"}]
    end

    desc 'Return a status.'
    params do
      requires :id, type: Integer, desc: 'Status id.'
    end
    route_param :id do
      get do
        {text: "test"}
      end
    end

    desc 'Create a status.'
    params do
      requires :status, type: String, desc: 'Your status.'
    end
    post do
    end

    desc 'Update a status.'
    params do
      requires :id, type: String, desc: 'Status ID.'
      requires :status, type: String, desc: 'Your status.'
    end
    put ':id' do
    end

    desc 'Delete a status.'
    params do
      requires :id, type: String, desc: 'Status ID.'
    end
    delete ':id' do
    end
  end
end
