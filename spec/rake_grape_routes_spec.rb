require 'spec_helper'
require 'open3'
require 'json'

RSpec.describe 'rake grape:routes' do
  let(:rails_app_dir) { File.expand_path('../dummy', __FILE__) }

  it 'is included into list of all tasks' do
    stdout, status = Open3.capture2("cd #{rails_app_dir} && rake --tasks")
    expect(status).to be_success
    expect(stdout).to include 'rake grape:routes[format]               # show API routes'
  end

  it 'shows Grape API routes' do
    stdout, status = Open3.capture2("cd #{rails_app_dir} && rake grape:routes")
    expect(status).to be_success
    expect(stdout).to include <<-EOF
        GET  |  /api/:version/statuses/public_timeline(.json)  |  v1  |  Return a public timeline.  
        GET  |  /api/:version/statuses/home_timeline(.json)    |  v1  |  Return a personal timeline.
        GET  |  /api/:version/statuses/:id(.json)              |  v1  |  Return a status.           
       POST  |  /api/:version/statuses(.json)                  |  v1  |  Create a status.           
        PUT  |  /api/:version/statuses/:id(.json)              |  v1  |  Update a status.           
     DELETE  |  /api/:version/statuses/:id(.json)              |  v1  |  Delete a status.           
    EOF
    expect(stdout).to include <<-EOF
        GET  |  /hello(.:format)                               |      |  Hello World!               
    EOF
  end

  it 'shows Grape API routes' do
    stdout, status = Open3.capture2("cd #{rails_app_dir} && rake grape:routes[json]")
    expect(status).to be_success
    expect(JSON.parse(stdout)).to eq([
      {
        "method"=> "GET",
        "path"=> "/hello(.:format)",
        "version"=>"  ",
        "desc"=>"Hello World!"
      },
      {
        "method"=> "GET",
        "path"=> "/api/:version/statuses/public_timeline(.json)",
        "version"=> "v1",
        "desc"=> "Return a public timeline."
      },
      {
        "method"=> "GET",
        "path"=>"/api/:version/statuses/home_timeline(.json)",
        "version"=>"v1",
        "desc"=>"Return a personal timeline."
      },
      {
        "method"=> "GET",
        "path"=>"/api/:version/statuses/:id(.json)",
        "version"=> "v1",
        "desc"=> "Return a status."
      },
      {
        "method"=> "POST",
        "path"=> "/api/:version/statuses(.json)",
        "version"=> "v1",
        "desc"=> "Create a status."
      },
      {
        "method"=> "PUT",
        "path"=> "/api/:version/statuses/:id(.json)",
        "version"=> "v1",
        "desc"=> "Update a status."
      },
      {
        "method"=> "DELETE",
        "path"=> "/api/:version/statuses/:id(.json)",
        "version"=> "v1",
        "desc"=> "Delete a status."
      }
    ]
    )

    expect(stdout).to include
  end
end
