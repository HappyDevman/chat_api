class UsersController < ApplicationController
  respond_to :json

  def index
    users = User.all
    render :index, locals: { users: users }
  end
end