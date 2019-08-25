class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    render plain: 'Hello, world'
  end
end
