module MollieIDeal
  class Engine < Rails::Engine
    config.mollie_ideal = MollieIDeal::Config
  end
end

