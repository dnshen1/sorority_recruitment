Rails.application.routes.draw do
  # Routes for the Bump_group resource:
  # CREATE
  get "/bump_groups/new", :controller => "bump_groups", :action => "new"
  post "/create_bump_group", :controller => "bump_groups", :action => "create"

  # READ
  get "/bump_groups", :controller => "bump_groups", :action => "index"
  get "/bump_groups/:id", :controller => "bump_groups", :action => "show"

  # UPDATE
  get "/bump_groups/:id/edit", :controller => "bump_groups", :action => "edit"
  post "/update_bump_group/:id", :controller => "bump_groups", :action => "update"

  # DELETE
  get "/delete_bump_group/:id", :controller => "bump_groups", :action => "destroy"
  #------------------------------

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
