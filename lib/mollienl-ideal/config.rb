module MollieNLIDeal
  module Config
    class << self
      # partner_id = numeric mollie partner id
      # report_url = url mollie calls to report transaction status
      # return_url = url Mollie redirects to after the transaction
      # test_mode = true/false Test mode parameter for Mollie.nl
      attr_accessor :partner_id, :report_url, :return_url, :test_mode

      def init!
        @defaults = {
          :@partner_id => nil,
          :@report_url => nil,
          :@return_url => nil,
          :@test_mode => false
        }
      end

      def reset!
        @defaults.each { |k, v| instance_variable_set(k, v) }
      end

      def update!
        @defaults.each do |k, v| 
          instance_variable_set(k, v) unless instance_variable_defined(k)
        end
      end
    end
    init!
    reset!
  end
end
