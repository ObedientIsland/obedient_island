class AdminController < ApplicationController
  http_basic_authenticate_with name: 'panski', password: 'popelpeter'
  layout 'admin'
end
