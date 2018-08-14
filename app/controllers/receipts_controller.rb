class ReceiptsController < ApplicationController
  before_action :authenticate_user!
  before_action :load_vendor, except: [:claim]
  before_action :load_receipt, only: [:edit, :update, :add_to_cart, :show, :claim]

  def new
    @receipt = @vendor.receipts.create
    redirect_to edit_receipt_path(@receipt)
  end

  def edit
    @products = @vendor.products
  end

  def update
  end

  def show
    @qrcode = RQRCode::QRCode.new(claim_receipt_url(@receipt), :size => 6, :level => :h)
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

  def claim
    if current_user.has_role?(:consumer) && @receipt.user_id.blank?
      flash[:success] = 'Receipt successfully claimed'
      @receipt.user_id = current_user
      @receipt.save
    else
      flash[:warning] = 'Invalid receipt barcode'
      redirect_to root_url
    end
  end


  private

  def load_vendor
    @vendor = Vendor.find(current_user.vendor_id)
  end

  def load_receipt
    @receipt = Receipt.find(params[:id])
  end
end
