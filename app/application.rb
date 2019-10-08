class Application
    @@item = [Item.new("apples", 3.25), Item.new("banana", 2.25)]

    def call(env)
        resp =Rack::Response.new
        req =Rack::Resonse.new(env)

      if req.path.match(/items/)  
        item_name = req.path.split("/items/").last
        if item = @@item.find{|i| i.name == item_name}
            resp.write item.price
    #   else
    #     resp.status = 400
    #     resp.write "Item not found"
        

         else
        resp.status = 400
        resp.write = "Route not found"
        end
        resp.finish
    end
end