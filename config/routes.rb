Rails.application.routes.draw do
  # set list index as the home page
  root to: 'lists#index'

  # right now we don't need to edit or update lists - further feature
  resources :lists do
    # nest bookmarks to lists on new and create routes needed
    resources :bookmarks, only: %i[new create]
  end
  resources :bookmarks, only: :destroy
end
