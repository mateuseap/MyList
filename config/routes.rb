Rails.application.routes.draw do  
  resources :usuarios do
    resources :tarefas do
      member do
        patch :finalizada
        patch :naofinalizada
      end
    end
  end
  
 root "usuarios#index"
end
