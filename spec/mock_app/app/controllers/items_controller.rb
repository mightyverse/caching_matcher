class ItemsController < ApplicationController

  caches_action :index

  def index
    render :text => "Index"
  end

  def edit
    render :text => "Edit"
  end

  def destroy
    expire_action url_for(:action => 'index')
    render :text => "Destroy"
  end
end
