class Users::RegistrationsController < Devise::RegistrationsController
  def build_resource(hash=nil)
    hash[:authority] = Authority.first
    super
  end
end
