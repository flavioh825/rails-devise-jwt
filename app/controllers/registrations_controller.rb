class RegistrationsController < Devise::RegistrationsController
  respond_to :json

  def create
    byebug
    build_resource(sign_up_params)
    resource.save
    render_resource(resource)
  end
end