module WebServer

using Genie

route("/hello") do
  "Hello World"
end

up(8000)

function hello_world()
  print("Hello World from Web Server!!")
end

end