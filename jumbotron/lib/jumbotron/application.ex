defmodule Jumbotron.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application
  alias Jumbotron.Server

  @impl true
  def start(_type, _args) do
    children = [
      # Starts a worker by calling: Jumbotron.Worker.start_link(arg)
      # {Jumbotron.Worker, arg}
      {Server, ~w[frogger pong tetris]}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Jumbotron.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
