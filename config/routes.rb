Rails.application.routes.draw do
  # Routes for the Seat resource:
  # CREATE
  get "/seats/new", :controller => "seats", :action => "new"
  post "/create_seat", :controller => "seats", :action => "create"

  # READ
  get "/seats", :controller => "seats", :action => "index"
  get "/seats/:id", :controller => "seats", :action => "show"

  # UPDATE
  get "/seats/:id/edit", :controller => "seats", :action => "edit"
  post "/update_seat/:id", :controller => "seats", :action => "update"

  # DELETE
  get "/delete_seat/:id", :controller => "seats", :action => "destroy"
  #------------------------------

  # Routes for the Electedofficial resource:
  # CREATE
  get "/electedofficials/new", :controller => "electedofficials", :action => "new"
  post "/create_electedofficial", :controller => "electedofficials", :action => "create"

  # READ
  get "/electedofficials", :controller => "electedofficials", :action => "index"
  get "/electedofficials/:id", :controller => "electedofficials", :action => "show"

  # UPDATE
  get "/electedofficials/:id/edit", :controller => "electedofficials", :action => "edit"
  post "/update_electedofficial/:id", :controller => "electedofficials", :action => "update"

  # DELETE
  get "/delete_electedofficial/:id", :controller => "electedofficials", :action => "destroy"
  #------------------------------

  # Routes for the District resource:
  # CREATE
  get "/districts/new", :controller => "districts", :action => "new"
  post "/create_district", :controller => "districts", :action => "create"

  # READ
  get "/districts", :controller => "districts", :action => "index"
  get "/districts/:id", :controller => "districts", :action => "show"

  # UPDATE
  get "/districts/:id/edit", :controller => "districts", :action => "edit"
  post "/update_district/:id", :controller => "districts", :action => "update"

  # DELETE
  get "/delete_district/:id", :controller => "districts", :action => "destroy"
  #------------------------------

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
