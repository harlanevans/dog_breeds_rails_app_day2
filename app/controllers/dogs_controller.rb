class DogsController < ApplicationController
  def index
    @dogs = Dog.all
  end

  def show
    @dog = Dog.find(params[:id])
  end

  def new
    @dog = Dog.new
  end

  def create
    @dog = Dog.new(dogs_params)
  
    if @dog.save
      redirect_to dogs_path
    else
      render :new
    end
  end

  def edit
    @dog = Dog.find(params[:id])
  end

  def update
    @dog = Dog.find(params[:id])

    if @dog.update(dogs_params)
      redirect_to dogs_path
    else
      render :edit
    end
  end

  def destroy
    @dog = Dog.find(params[:id]).destroy
    redirect_to dogs_path
  end
  

  private

    def dogs_params
      params.require(:dog).permit(:name, :breed, :age)
    end
end
