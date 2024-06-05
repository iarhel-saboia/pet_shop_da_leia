class AnimalsController < ApplicationController
  def index
    @animals = Animal.all
  end

  def show
    @client = Client.find_by(id: params[:client_id])
    @animal = Animal.find(params[:id])
  end

  def new
    @client = Client.find_by(id: params[:client_id])
    @animal = Animal.new
  end

  def create
    @client = Client.find_by(id: params[:client_id])
    @animal = Animal.new(animal_photo: params[:animal_photo], client_id: params[:client_id], name: params[:name], age: params[:age], breed: params[:breed], vaccines: params[:vaccines], deseases: params[:deseases])

    if @animal.save
      redirect_to @client
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @client = Client.find_by(id: params[:client_id])
    @animal = Animal.find(params[:id])
  end

  def update
    @client = Client.find_by(id: params[:client_id])
    @animal = Animal.find(params[:id])

    if @animal.update(animal_params)
      redirect_to @animal
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @animal = Animal.find(params[:id])
    @animal.destroy

    redirect_to root_path, status: :see_other
  end

  private
    def animal_params
      params.require(:animal).permit(:client_id, :name, :age, :breed, :vaccines, :deseases, :animal_photo)
    end
end
