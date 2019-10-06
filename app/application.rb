require 'pry'
class Application

    @@items = []

    def call (env)
        response = Rack::Response.new
        request = Rack::Request.new(env)

        
        if request.path.match("/items/")
            item_to_find = request.path.split("/items/").last
            item = @@items.find{|item|item.name == item_to_find}
            if item
                response.write "#{item.price}"
            else
                response.status = 400
                response.write "Item not found" 
            end
        else
            response.status = 404
            response.write "Route not found"
            #binding.pry
            end
        response.finish
    end
end