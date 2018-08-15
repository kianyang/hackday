class ReceiptsController < ApplicationController
  before_action :authenticate_user!

  def index
    @header = "Receipts"
  end

  def show
    @header = "Receipts"
  end
end
