class RepositoriesController < ApplicationController

  def search

  end

  def github_search

    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
        req.params['client_id'] = client_id
        req.params['client_secret'] = client_secret
        req.params['q'] = 'tetris'
      end
      body = JSON.parse(@resp.body)
      if @resp.success?
        @venues = body["response"]["items"]
      end

    render 'search'

  end
end
