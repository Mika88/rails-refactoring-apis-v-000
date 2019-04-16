class RepositoriesController < ApplicationController
  def index
    github = GithubService.new
    @repos_array = github.get_repos
    @user = github.get_username
  end

  def create
    response = Faraday.post "https://api.github.com/user/repos", {name: params[:name]}.to_json, {'Authorization' => "token #{session[:token]}", 'Accept' => 'application/json'}
    redirect_to '/'
  end
end
