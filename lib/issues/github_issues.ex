defmodule Issues.GithubIssues do
  @user_agent [ {"User-agent", "Elixir dave@pragprog.com"} ]

  def fetch(user, project) do
    issues_url(user, project)
    |> HTTPoison.get(@user_agent)
    |> handle_response
  end

  # use a module attribute to fetch the value at compile time
  @github_url Application.get_env(:issues, :github_url)

  def issues_url(user, project) do
    "#{@github_url}/repos/#{user}/#{project}/issues"    
  end

  def handle_response({:ok, body}) do
    { :ok, :jsx.decode(body) }
  end
  def handle_response({ ___, body}) do
    { :error, :jsx.decode(body) }
  end
end


