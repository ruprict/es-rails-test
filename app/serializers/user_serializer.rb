class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :password, :auth_token
end
