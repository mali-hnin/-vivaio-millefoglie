Rails.application.routes.draw do
  root to: 'pages#home'

  devise_for :users
  resources :plants do
    collection do    # collection => no restaurant id in URL
      get 'by_created', to: "plants#by_created"
      get 'by_updated', to: "plants#by_updated"
      get 'export', to: "plants#export"
    end
  end
  resources :line_items
  resources :carts do
    resources :orders, only: [:new, :create]
  end

  get "/catalogo-intro", to: "pages#catalogo_intro"
  get "/catalogo", to: "pages#catalogo"
  get "/giardini", to: "pages#giardini"
  get "/millefoglie-flowers-lab", to: "pages#flowerslab", as: :flowerslab
  get "/contatti", to: "pages#contatti", as: :contatti
  get "/eventi", to: "pages#eventi"
  get "/bonus-verde", to: "pages#bonusverde", as: :bonusverde
  get "/come-acquistare", to: "pages#comeacquistare", as: :acquistare
  get "/abbonamento", to: "pages#abbonamento"
  get "/condizionivendita", to: "pages#condizionivendita"
  get "/admin_catalogo", to: "plants#admin_catalogo"

  mount Attachinary::Engine => "/attachinary"
end
