module MollieNLIDeal
  class Bank
    attr_accessor :id, :name

    def initialize(values=nil)
      return if values.nil?

      if values.kind_of?(Hash)
        values.each { |key, value| self.send key.to_s + "=", value }
      elsif values.kind_of?(REXML::Element)
        @id = values.get_text("bank_id").to_s.to_i
        @name = values.get_text("bank_name").to_s
      end
    end
  end
end

