class SalesController < ApplicationController
  def index
    @sales = Sale.all
  end

  def show
    @sale = Sale.find(params[:id])
  end

  def new
    @sale = Sale.new
    @clients = Client.all
    @products = Product.all
  end

  def create
    @sale = Sale.new(sale_params)
    product = Product.find(@sale.product_id)
    puts(product.quantity)
    puts(@sale.quantity)
    product.update(quantity: product.quantity - @sale.quantity)
    @sale.update(total_value: @sale.quantity * product.sale_price)
    client = Client.find(@sale.client_id)
    client.update(balance: client.balance - @sale.total_value)

    if @sale.save
      redirect_to sales_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @sale = Sale.find(params[:id])
  end

  def update
    @sale = Sale.find(params[:id])

    if @sale.update(sale_params)
      redirect_to @sale
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @sale = Sale.find(params[:id])
    @sale.destroy

    redirect_to root_path, status: :see_other
  end

  private
    def sale_params
      params.require(:sale).permit(:client_id, :product_id, :quantity, :total_value)
    end
end
