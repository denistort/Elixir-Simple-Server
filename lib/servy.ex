defmodule Servy do
  require Servy.Handler

  def handle(request) do
    Servy.Handler.handle(request)
  end
end


example_post_bears_request = """
POST /bears HTTP/1.1
Host: example.com
User-Agent: ChromeBrowser/1.0
Accept: */*
Content-Type: application/x-www-form-urlencoded
Content-Length: 21

name=baloo&type=brown
"""

example_get_bear_request = """
GET /bears/2 HTTP/1.1
Host: example.com
User-Agent: ChromeBrowser/1.0
Accept: */*
Content-Type: application/json
Content-Length: 21


"""


IO.puts Servy.handle example_post_bears_request
IO.puts Servy.handle example_get_bear_request
