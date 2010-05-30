class IngredientsController < ApplicationController
  def index
    if params[:query]
      @ingredients = Ingredient.find(:all, :conditions => ['name LIKE ?', "%#{params[:query]}%"])


      suggestions = Array.new
      for ingr in @ingredients
        suggestions.push(ingr.name)
      end

       response.headers['Content-type'] = "text/plain; charset=utf-8"

      ret = {}
      ret["query"] = params[:query]
      ret["suggestions"] = suggestions
      

      render :text => ret.to_json
      
    else
      @ingredients = Ingredient.all
    end
  end
  
  def show
    @ingredient = Ingredient.find(params[:id])
  end
  
  def new
    @ingredient = Ingredient.new
  end
  
  def create
    @ingredient = Ingredient.new(params[:ingredient])
    if @ingredient.save
      flash[:notice] = "Successfully created ingredient."
      redirect_to @ingredient
    else
      render :action => 'new'
    end
  end
  
  def edit
    @ingredient = Ingredient.find(params[:id])
  end
  
  def update
    @ingredient = Ingredient.find(params[:id])
    if @ingredient.update_attributes(params[:ingredient])
      flash[:notice] = "Successfully updated ingredient."
      redirect_to @ingredient
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @ingredient = Ingredient.find(params[:id])
    @ingredient.destroy
    flash[:notice] = "Successfully destroyed ingredient."
    redirect_to ingredients_url
  end
end
