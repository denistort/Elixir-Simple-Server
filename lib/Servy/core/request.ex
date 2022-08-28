defmodule Servy.Core.Request do
  @moduledoc """
   GLOBAL PARSED REQUEST STRUCT
  """

  @doc "STRUCT OF PARSED INITIAL HTTP REQUEST"
  defstruct [
    method: "",
    path: "",
    host: "",
    headers: %{},
    params: %{},
    resp_body: "",
    status_code: nil,
    content_type: ""
  ]

  def get_status(%Servy.Core.Request{} = req) do
    "#{req.status_code} #{status_text(req.status_code)}"
  end

  defp status_text(code) do
    %{
      200 => "OK",
      201 => "Created",
      401 => "Unauthorized",
      403 => "Forbidden",
      404 => "Not found",
      500 => "Internal Server Error"
    }[code]
  end
end
