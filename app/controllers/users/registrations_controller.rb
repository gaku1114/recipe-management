# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  def update_resource(resource, params)
    resource.update_without_password(params)
  end

  def after_update_path_for(resource)
    dishes_path
  end
end
