class PagesController < ApplicationController
  def home
    url = "https://zt-api-server.herokuapp.com/categories/2/subjects"
    response = RestClient.get(url, headers={})
    render json: response.body
  end
end
