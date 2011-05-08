module MollieIDeal
  module Config
    class << self
      attr_accessor :partner_id, :report_url, :return_url, :test_mode

      def init!
        puts "Init config"
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