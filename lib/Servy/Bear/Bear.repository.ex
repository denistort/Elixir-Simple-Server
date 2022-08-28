defmodule Servy.Bear.Repository do

  alias Servy.Bear.Entity, as: Bear

  @bears [
    %Bear{ id: 1, name: "jo", type: "green", hibernating: true },
    %Bear{ id: 2, name: "mego", type: "white", hibernating: false },
    %Bear{ id: 3, name: "panda huilo", type: "green", hibernating: true },
    %Bear{ id: 4, name: "jow", type: "green", hibernating: true },
    %Bear{ id: 5, name: "jottew", type: "green", hibernating: false },
    %Bear{ id: 6, name: "zxcvb", type: "green", hibernating: true }
  ]
  def getAll(), do: @bears
  def find(id) when is_integer(id), do:
    Enum.filter(@bears, fn bear -> id == bear.id end)
end
