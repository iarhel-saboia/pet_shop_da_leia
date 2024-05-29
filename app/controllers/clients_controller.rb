class ClientsController < ApplicationController
  def index
    @clients = Client.all
  end

  def show
    @animal = Animal.where(params[:client_id])
    @client = Client.find_by(id: params[:id])
  end

  def new
    @client = Client.new
  end

  def create
    @client = Client.new(client_params)

    if @client.save
      redirect_to @client
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @client = Client.find(params[:id])
  end

  def update
    @client = Client.find(params[:id])

    if @client.update(client_params)
      redirect_to @client
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @client = Client.find(params[:id])
    @client.destroy

    redirect_to clients_path, status: :see_other
  end

  private
    def client_params
      params.require(:client).permit(:balance, :name, :cpf, :cep, :adress, :house_n, :add_inf)
    end
end
