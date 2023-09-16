class WelcomeController < ApplicationController
  def index
    render layout: 'intro'
  end
end
