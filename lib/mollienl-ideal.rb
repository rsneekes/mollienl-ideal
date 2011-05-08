require "net/http"
require "uri"
require 'rexml/document'
require 'rails'

require 'mollienl-ideal/config'

require 'mollienl-ideal/api'
require 'mollienl-ideal/bank'
require 'mollienl-ideal/payment_request'
require 'mollienl-ideal/payment_result'

require 'mollienl-ideal/engine' if defined?(Rails) && Rails::VERSION::MAJOR == 3
