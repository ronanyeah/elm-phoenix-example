defmodule Mix.Tasks.Npm do
  use Mix.Task

  @shortdoc "Executes npm scripts from assets directory."

  def run([cmd | _tail]) do
    case Mix.shell.cmd("cd ./assets && npm run #{cmd}", stderr_to_stdout: true) do
      0 -> :ok
      a -> raise "npm command failure exit code: #{a}"
    end
  end
end
