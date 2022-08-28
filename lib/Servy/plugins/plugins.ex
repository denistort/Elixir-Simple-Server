defmodule Servy.Plugins do

  alias Servy.Core.Request, as: Request

  def track(%Request{ status_code: 404, path: path } = req) do
    IO.puts("ON PATH #{path} is not found status of response is 404")
    req
  end

  def track(%Request{} = req) do
    req
  end

  def log(%Request{} = req) do
    # TODO: CREATE A LOGGER FOR REQUEST
    IO.inspect req
    req
  end
end
