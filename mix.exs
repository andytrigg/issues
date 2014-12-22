defmodule Issues.Mixfile do
  use Mix.Project
    
  def project do
    [ app:     :issues,
    version: "0.0.1",
    name: "Issues",
    source_url: "https://github.com/andytrigg/issues",
    elixir:  ">= 0.0.0",
    escript: escript_config,
    deps:    deps ]
  end
                                
  # Configuration for the OTP application
  def application do
    [ 
      applications: [ :logger, :httpoison, :jsx ] 
    ]
  end
                                                      
  defp deps do
    [
      { :httpoison, "~> 0.4.0"},
      { :jsx,       "~> 2.0" },
      { :ex_doc, "~>0.6" },
      { :earmark, ">= 0.0.0" }
    ]
  end

  defp escript_config do
    [ main_module: Issues.CLI ]
  end
end
