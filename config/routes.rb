Rails.application.routes.draw do
  # Routes for the Party resource:
  # CREATE
  get "/parties/new", :controller => "parties", :action => "new"
  post "/create_party", :controller => "parties", :action => "create"

  # READ
  get "/parties", :controller => "parties", :action => "index"
  get "/parties/:id", :controller => "parties", :action => "show"

  # UPDATE
  get "/parties/:id/edit", :controller => "parties", :action => "edit"
  post "/update_party/:id", :controller => "parties", :action => "update"

  # DELETE
  get "/delete_party/:id", :controller => "parties", :action => "destroy"
  #------------------------------

  devise_for :members
  # Routes for the Member resource:
  # READ
  get "/members", :controller => "members", :action => "index"
  get "/members/:id", :controller => "members", :action => "show"


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
