Rails.application.routes.draw do
  # Routes for the Position resource:
  # CREATE
  get "/positions/new", :controller => "positions", :action => "new"
  post "/create_position", :controller => "positions", :action => "create"

  # READ
  get "/positions", :controller => "positions", :action => "index"
  get "/positions/:id", :controller => "positions", :action => "show"

  # UPDATE
  get "/positions/:id/edit", :controller => "positions", :action => "edit"
  post "/update_position/:id", :controller => "positions", :action => "update"

  # DELETE
  get "/delete_position/:id", :controller => "positions", :action => "destroy"
  #------------------------------

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
