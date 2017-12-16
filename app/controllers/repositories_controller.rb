class RepositoriesController < ApplicationController

  def search

  end

  def github_search

    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
        req.params['q'] = 'tetris'
      end
      body = JSON.parse(@resp.body)
      binding.pry
      if @resp.success?
        @venues = body["response"]["items"]
      end

    render 'search'

  end

end
