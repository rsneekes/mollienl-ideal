require "net/http"
require "uri"
require 'rexml/document'
require 'rails'

require 'mollie-ideal/config'

require 'mollie-ideal/api'
require 'mollie-ideal/bank'
require 'mollie-ideal/payment_request'
require 'mollie-ideal/payment_result'

require 'mollie-ideal/engine' if defined?(Rails) && Rails::VERSION::MAJOR == 3
