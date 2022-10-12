class Api::V1::UsersController < ApplicationController

  def create
    binding.pry
    test = index
    response_body = JSON.parse(test, symbolize_names: true)
  end


end
