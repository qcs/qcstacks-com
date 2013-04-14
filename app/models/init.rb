# encoding: utf-8
require 'sequel'

#DB = Sequel.postgres 'dbname', user:'bduser', password:'dbpass', host:'localhost'
#DB << "SET CLIENT_ENCODING TO 'UTF8';"
DB = Sequel.sqlite 'db/qcs_development.sqlite'

require_relative 'subscriber'
