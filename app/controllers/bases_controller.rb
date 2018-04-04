class BasesController < ApplicationController
  before_action :authenticate_user!
end
