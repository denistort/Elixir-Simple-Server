defmodule Servy.Controllers.Bear do

  alias Servy.Core.Request, as: Request
  alias Servy.Bear.Repository, as: BearRepo

  def index(%Request{} = req) do

  end


  def show(%Request{} = req, %{ "id" => id }) do
    foundedBear = BearRepo.find(id)
    IO.inspect( foundedBear )
    %{ req | status_code: 200, resp_body: "<ul>
      #{ Enum.map(foundedBear, fn bear -> "<li>#{ bear.name } #{ bear.type } </li>" end) }
    </ul>", params: %{ id: id }}
  end

  def postBear(%Request{} = req, %{"name" => name, "type" => type }) do
    %{ req | status_code: 200, resp_body: "Bear info name => #{name} type => #{type}"}
  end
end
