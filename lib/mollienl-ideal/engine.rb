module MollieNLIDeal
  class Engine < Rails::Engine
    config.mollie_ideal = MollieNLIDeal::Config
  end
end

