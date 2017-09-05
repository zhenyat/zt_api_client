class PagesController < ApplicationController
  def home
    url = "http://localhost:3001/categories/1/subjects"  # server: rails s -p 3001
#    url = "https://zt-api-server.herokuapp.com/categories/1/subjects"
#    url = "https://btc-e.nz/api/3/info"

    begin
      response = RestClient.get(url, headers={})
    rescue RestClient::ExceptionWithResponse => e
      puts "HTTP Request error: #{e}"
      render json: e
    rescue  => e
      render json: e
      puts "HTTP Request error: #{e}"
    else
      puts "ZT OK! response = #{response}"
      puts response.to_json.class
#      render json: response.body
      render json: handle_response(response.body)
    end
  end
  
  def handle_response data
    array = JSON.parse(data)
    
    out_data = ''
    array.each do |el|
      puts "#{el['name']}: #{el['abstract']}"
      out_data << "#{el['name']} - #{el['title']}: #{el['abstract']} |  #{el['description']}\n"
    end
    out_data
  end
end
