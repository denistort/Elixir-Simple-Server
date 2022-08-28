defmodule Servy.Plugins.ParserReq do

  alias Servy.Core.Request, as: Request


  def parse(request) do
    # TODO: PARSE THE REQUEST STRING INTO A MAP
    IO.inspect(String.split(request, "\n\n"))

    [top, params_string] = String.split(request, "\n\n")

    # Headers Parsing

    [request_line | headers_list ] = String.split(top, "\n")

    # REQUEST LINE PARSING
    [method, path, host] = String.split(request_line, " ")

    headers = parse_headers(headers_list, %{})
    params = decode_params(headers["Content-Type"], params_string)

    %Request{
      method: method,
      path: path,
      host: host,
      resp_body: "",
      headers: headers,
      params: params,
      status_code: nil,
      content_type: "text/html"
    }
  end

  def decode_params("application/x-www-form-urlencoded", params_string) do
    params_string
    |> String.trim
    |> URI.decode_query()
  end
  def decode_params(_,_), do: %{}

  # Recursive parse headers list
  def parse_headers([head | tail], headers) do
    [key, value] = String.split(head, ": ")
    headers = Map.put(headers, key, value)
    parse_headers(tail, headers)
  end
  def parse_headers([], headers), do: headers
end
