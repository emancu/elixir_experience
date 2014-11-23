defmodule ElixirProblems.ProblemController do
  use Phoenix.Controller

  plug :action

  def index(conn, _params) do
    render conn, "index.html"
  end

  def show(conn, %{"id" => id_string}) do
    {id, _} = Integer.parse(id_string)
    render conn, "show.html", id: id
  end

  def update(conn, %{"id" => id, "code" => code}) do
    {results, exit_code} = System.cmd("docker", ["run", "trenpixster/elixir", "elixir", "-e", code])
    render conn, "results.html", id: id, code: code, results: results
  end
end