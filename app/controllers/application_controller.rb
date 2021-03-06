# frozen_string_literal: true

class ApplicationController < ActionController::Base
  private

  def after_sign_in_path_for(resource)
    stored_location_for(resource) || admin_root_path
  end
end
