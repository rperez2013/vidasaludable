class User < ActiveRecord::Base
  attr_accessible :name, :provider, :uid, :tipo, :email, :location
  has_many :products
  def self.from_omniauth(auth)
    find_by_provider_and_uid(auth["provider"], auth["uid"]) || create_with_omniauth(auth)
  end

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["name"]      
      user.email=auth["info"]["email"]
      user.tipo=auth["info"]["nickname"]
      user.location=auth["info"]["location"]
    end
  end
end
