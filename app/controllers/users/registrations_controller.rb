class Users::RegistrationsController < Devise::RegistrationsController
  def build_resource(hash=nil)
    hash[:authority] = Authority.find(1)
    super
  end
end
