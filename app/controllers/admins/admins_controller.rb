module Admins
  class AdminsController < ApplicationController
    layout 'admin'
    before_action :authenticate_admin!

    def pages; end
  end
end
