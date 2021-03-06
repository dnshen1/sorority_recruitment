Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root :to => "bump_groups#index"
  # Routes for the Conversation resource:
  # CREATE
  get "/conversations/new", :controller => "conversations", :action => "new"
  post "/create_conversation", :controller => "conversations", :action => "create"

  # READ
  get "/conversations", :controller => "conversations", :action => "index"
  get "/conversations/:id", :controller => "conversations", :action => "show"

  # UPDATE
  get "/conversations/:id/edit", :controller => "conversations", :action => "edit"
  post "/update_conversation/:id", :controller => "conversations", :action => "update"

  # DELETE
  get "/delete_conversation/:id", :controller => "conversations", :action => "destroy"
  #------------------------------

  # Routes for the Pnm resource:
  # CREATE
  get "/pnms/new", :controller => "pnms", :action => "new"
  post "/create_pnm", :controller => "pnms", :action => "create"

  # READ
  get "/pnms", :controller => "pnms", :action => "index"
  get "/pnms/:id", :controller => "pnms", :action => "show"

  # UPDATE
  get "/pnms/:id/edit", :controller => "pnms", :action => "edit"
  post "/update_pnm/:id", :controller => "pnms", :action => "update"

  # DELETE
  get "/delete_pnm/:id", :controller => "pnms", :action => "destroy"
  #------------------------------

  # Routes for the Rotation resource:
  # CREATE
  get "/rotations/new", :controller => "rotations", :action => "new"
  post "/create_rotation", :controller => "rotations", :action => "create"

  # READ
  get "/rotations", :controller => "rotations", :action => "index"
  get "/rotations/:id", :controller => "rotations", :action => "show"

  # UPDATE
  get "/rotations/:id/edit", :controller => "rotations", :action => "edit"
  post "/update_rotation/:id", :controller => "rotations", :action => "update"

  # DELETE
  get "/delete_rotation/:id", :controller => "rotations", :action => "destroy"
  #------------------------------

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
