defmodule Servy.Router do

  @moduledoc """
    OUR SERVER ROUTER
  """
  alias Servy.Core.Request, as: Request
  alias Servy.Controllers.Bear, as: BearController
  @pages_path Path.expand("../pages", __DIR__)


  def route(%Request{ method: "GET", path: "/wildthing" } = req) do
    %{ req | status_code: 200, resp_body: "Bears, Lions, Tigers" }
  end

  def route(%Request{ method: "POST", path: "/super" } = req) do
    %{ req | status_code: 200, resp_body: "Super route" }
  end

  def route(%Request{ method: "GET", path: "/about" } = req) do
    handle_result = fn
      { :ok, contents } -> %{ req | status_code: 200, resp_body: contents }
      { :error, :enoent } -> %{ req | status_code: 404, resp_body: "This page is not found on server" }
      { :error, reason } -> %{ req | status_code: 500, resp_body: reason }
    end
    @pages_path
    |> Path.join("about.html")
    |> File.read()
    |> handle_result.()
  end

  def route(%Request{ method: "GET", path: "/bears/" <> id } = req) do
    {int, _} = Integer.parse(id)
    params = Map.put(req.params, "id", int)
    BearController.show(req, params)
  end

  def route(%Request{ method: "POST", path: "/bears" } = req) do
    BearController.postBear(req, req.params)
  end

  def route(%Request{ path: path } = req) do
    %{ req | status_code: 404, resp_body: "#{"No path here #{path} "}" }
  end
end
