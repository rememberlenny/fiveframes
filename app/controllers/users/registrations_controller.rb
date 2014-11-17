class Users::RegistrationsController < Devise::RegistrationsController
  include ApplicationHelper

  def create
    super
  end

  def new
    super
  end

  def edit
    super
  end

  def after_sign_up_path_for(resource)
    after_sign_in_path_for(resource)
  end
end
