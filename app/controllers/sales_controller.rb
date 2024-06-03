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

  def preview_pdf
    sales = Sale.all
    pdf = Prawn::Document.new
    pdf.text "Titulozão", size: 40

    pdf.text 'RELATÓRIO GERAL DE VENDAS', size: 30, style: :bold


      sales = sales.map do |sale|
        [
          sale.client.name,
          sale.product.name,
          sale.quantity,
          sale.total_value
        ]
      end

      pdf.table [['Produto', 'Quantidade', 'Unidade', 'Valor Parcial']] + sales,
                header: true,
                column_widths: { 0 => 200, 1 => 100, 2 => 100, 3 => 100 },
                cell_style: { border_width: 0.5 } do
        row(0).style(font_style: :bold, background_color: 'CCCCCC')
        columns(0..3).align = :center
      end

    send_data(pdf.render, filename:'teste_preview', type: 'application/pdf', disposition: 'inline')
  end

  def download_pdf
    sales = Sale.all
    pdf = Prawn::Document.new

    pdf.text 'RELATÓRIO GERAL DE VENDAS', size: 30, style: :bold

      pdf.text "Cliente: #{sales.client.name} | Produto: #{sales.product.name} | Quantidade: #{sales.quantity} | Valor: #{sales.total_value}" , style: :bold

      sales.each do |sales|
        [
          sales.client.name,
          sales.product.name,
          sales.quantity,
          sales.total_value
        ]
      end

    send_data(pdf.render,
              filename: 'vendas_geral.pdf',
              type: 'application/pdf')
  end

  private
    def sale_params
      params.require(:sale).permit(:client_id, :product_id, :quantity, :total_value)
    end
end
