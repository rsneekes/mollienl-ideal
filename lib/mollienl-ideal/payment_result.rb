module MollieNLIDeal
  class PaymentResult < PaymentRequest
    attr_accessor :payed, :consumer_name, :consumer_account, :consumer_city

    def initialize(values)
      return if values.nil?

      super(values)

      if values.kind_of?(REXML::Element)
        @payed = ("true" === values.get_text("payed").to_s)
        @consumer_name = values.get_text("consumer/consumerName").to_s
        @consumer_account = values.get_text("consumer/consumerAccount").to_s
        @consumer_city = values.get_text("consumer/consumerCity").to_s
      end
    end
  end
end

