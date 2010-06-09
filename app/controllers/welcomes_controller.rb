class WelcomesController < ApplicationController
  layout "welcome"
  def index
    render :action => "index", :layout => 'welcome'
  end
    
end
