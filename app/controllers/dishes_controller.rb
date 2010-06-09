class DishesController < ApplicationController
  layout "admin"
  def index
    
    @dishes = Dish.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @dishes }
    end

  end
  
  def show
    @dish = Dish.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @dishe }
    end

  end
  
  def new
    @dish = Dish.new
    3.times { @dish.compositions.build }
  end
  
  def create
    @dish = Dish.new(params[:dish])
    if @dish.save
      flash[:notice] = "Successfully created dish."
      redirect_to @dish
    else
      render :action => 'new'
    end
  end
  
  def edit
    @dish = Dish.find(params[:id])
  end
  
  def update
    @dish = Dish.find(params[:id])
    if @dish.update_attributes(params[:dish])
      flash[:notice] = "Successfully updated dish."
      redirect_to @dish
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @dish = Dish.find(params[:id])
    @dish.destroy
    flash[:notice] = "Successfully destroyed dish."
    redirect_to dishes_url
  end
end
