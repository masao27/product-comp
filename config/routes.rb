Rails.application.routes.draw do

  root 'products#search'
  get  'products/search'  => 'products#search'

end
