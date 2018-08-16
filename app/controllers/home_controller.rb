class HomeController < ApplicationController
  def index
    render layout: "homepage"
  end

  def dashboard
    @header = "Dashboard"
  end

  def vendor_dashboard
    @header = "Dashboard"
  end
end
