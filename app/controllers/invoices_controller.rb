class InvoicesController < ApplicationController
  before_action :authenticate_user!
  before_action :load_vendor, except: [:claim]
  before_action :load_receipt, only: [:edit, :update, :add_to_cart, :show, :claim]

  def new
    @invoice = @vendor.receipts.create
    redirect_to edit_invoice_path(@invoice)
  end

  def edit
    @products = @vendor.products
  end

  def update
  end

  def show
    @qrcode = RQRCode::QRCode.new(claim_invoice_url(@invoice), :size => 6, :level => :h)
  end

  def add_to_cart
    product = Product.find(params[:product_id])
    @invoice.line_items.create({
      description: product.name,
      price: product.price,
      quantity: 1,
      sku: product.sku
    })

    redirect_to edit_invoice_path(@invoice)
  end

  def claim
    if current_user.has_role?(:consumer) && @invoice.user_id.blank?
      flash[:success] = 'Receipt successfully claimed'
      @invoice.user_id = current_user
      @invoice.save
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
    @invoice = Receipt.find(params[:id])
  end
end
