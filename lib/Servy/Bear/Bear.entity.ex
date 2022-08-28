defmodule Servy.Bear.Entity do
  defstruct [
    id: nil,
    name: "",
    type: "",
    hibernating: false,
  ]

  def getInfo() do
    %Servy.Bear.Entity{}
  end
end
