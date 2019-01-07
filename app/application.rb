
class Application
    @@items = []
    def call(env)
        resp = Rack::Response.new
        req = Rack::Request.new(env)

        if req.path.match(/items/)
            given_item = req.path.split("/items/").last
            match = @@items.map{|i| i.name}
            if match.include?(given_item)
                item = @@items.find {|i| i.name = given_item}
                resp.write item.price
                

            else
                resp.write("Item not found")
                resp.status = 400
            end


        else
            resp.write "Route not found"
            resp.status = 404
        end
        resp.finish
    end
end