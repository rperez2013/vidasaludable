Rails.application.config.middleware.use OmniAuth::Builder do
    provider :identity,fields: [:name,:email,:address,:birth,:tipo,:nickname,:location], on_failed_registration: lambda { |env|    
    IdentitiesController.action(:new).call(env)
  }  
end
OmniAuth.config.on_failure = Proc.new { |env|
  OmniAuth::FailureEndpoint.new(env).redirect_to_failure
} 
