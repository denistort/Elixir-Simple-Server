defmodule Servy.Handler do

  @moduledoc """
    HANDLE HTTP REQUEST...
  """
  import Servy.Plugins, only: [ log: 1, track: 1 ]
  import Servy.Plugins.ParserReq, only: [ parse: 1]
  alias Servy.Core.Request, as: Request
  require Servy.Router

  @doc """
    TRANSFORMS A REQUEST TO THE RESPONSE
  """
  def handle(raw_request) do
    raw_request
    |> parse
    |> log
    |> handleRoute
    |> track
    |> format_response
  end

  def handleRoute(%Request{} = req) do
    req = Servy.Router.route(req)
  end

  def format_response(%Request{} = req) do
    """
    HTTP/1.1 #{Request.get_status(req)}
    Content-Type: #{req.content_type}
    Content-Length: #{String.length(req.resp_body)}

    #{req.resp_body}
    """
  end
end
