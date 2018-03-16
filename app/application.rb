class Application

  @@item = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)

      item_name = req.path.split("/songs/").last
      item_found = @@item.find{|item| item.name == item_name} 

      resp.write item_found.price
    else
      resp.write "Route not found"
      resp.status = 404
    end

    resp.finish
  end

end
