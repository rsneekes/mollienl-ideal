module MollieIDeal
  class PaymentRequest
    attr_accessor :transaction_id, :amount, :currency, :url, :message

    def initialize(values=nil)
      return if values.nil?

      if values.kind_of?(Hash)
        values.each { |key, value| self.send key.to_s + "=", value }
      elsif values.kind_of?(REXML::Element)
        puts values
        @transaction_id = values.get_text("transaction_id").to_s
        @amount = values.get_text("amount").to_s.to_i
        @currency = values.get_text("currency").to_s
        @url = URI.unescape(values.get_text("URL").to_s) 
        @message = values.get_text("message").to_s
      end
    end
  end
end

