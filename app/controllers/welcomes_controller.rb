class WelcomesController < ApplicationController
  def index
    render :action => "index", :layout => 'welcome'
  end
    
end
