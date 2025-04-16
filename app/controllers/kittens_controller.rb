class KittensController < ApplicationController
  def index
    @kittens = Kitten.all
  end

  def new
    @kitten = Kitten.new
  end

  def create
    @kitten = Kitten.new(kitten_params)

    if @kitten.save
      flash[:notice] = "The kitten has successfully been created."
      redirect_to @kitten
    else
      flash[:notice] = "Some of the information you have entered is not valid..."
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @kitten = Kitten.find(params[:id])
  end

  def edit
    @kitten = Kitten.find(params[:id])
  end

  def update
    @kitten = Kitten.find(params[:id])

    if @kitten.update(kitten_params)
      flash[:notice] = "The kitten's information has successfully been updated."
      redirect_to @kitten
    else
      flash[:notice] = "Some of the information you have entered is not valid..."
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @kitten = Kitten.find(params[:id])

    @kitten.destroy

    flash[:notice] = "The kitten's information has been deleted."
    redirect_to root_path
  end

  private

  def kitten_params
    params.expect(kitten: [ :name, :age, :cuteness, :softness ])
  end
end
