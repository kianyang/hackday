class ReceiptsController < ApplicationController
  before_action :authenticate_user!
  before_action :load_vendor
  before_action :load_receipt, only: [:edit, :update, :add_to_cart, :show]

  def new
    @receipt = @vendor.receipts.create
    redirect_to edit_receipt_path(@receipt)
  end

  def edit
    @products = @vendor.products
  end

  def update
  end

  def add_to_cart
    product = Product.find(params[:product_id])
    @receipt.line_items.create({
      description: product.name,
      price: product.price,
      quantity: 1,
      sku: product.sku
    })

    redirect_to edit_receipt_path(@receipt)
  end

  private

  def load_vendor
    @vendor = current_user.vendor
  end

  def load_receipt
    @receipt = Receipt.find(params[:id])
  end
end
