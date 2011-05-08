module MollieIDeal
  MOLLIE_URL = "https://secure.mollie.nl/xml/ideal?"

  def self.get_banks
    banks = []

    doc = get_data({ "a" => "banklist"})
    doc.elements.each("response/bank") do |elem|
      banks << Bank.new(elem)
    end

    banks
  end

  def self.do_request_payment(amount, description, bank_id)
    p = { 
      :a => "fetch", 
      :partnerid => PARTNER_ID,
      :description => description,
      :reporturl => REPORT_URL,
      :returnurl => RETURN_URL,
      :amount => amount,
      :bank_id => bank_id
    }

    doc = get_data(p)
    doc.elements.each("response/order") do |elem|
      return PaymentRequest.new(elem)
    end
  end

  def self.check_status(transaction_id)
    p = { 
      :a => "check", 
      :partnerid => PARTNER_ID,
      :transaction_id => transaction_id
    }

    doc = get_data(p)
    doc.elements.each("response/order") do |elem|
      return PaymentResult.new(elem)
    end
  end

  def self.get_data(params)
    params["testmode"] = "true"

    uri = URI.parse(MOLLIE_URL + URI.encode_www_form(params))
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true

    response = http.request(Net::HTTP::Get.new(uri.request_uri))
    puts response.body

    doc = REXML::Document.new response.body
    doc.elements.each("response/item[@type='error']/message") do |elem|
      raise elem.text
    end

    doc
  end
end

