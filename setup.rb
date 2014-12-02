require 'bundler/setup'
require 'sqlite3'
require 'lotus/model'
require 'lotus/model/adapters/sql_adapter'

connection_uri = "sqlite://#{__dir__}/test.db"

database = Sequel.connect(connectiosn_uri)

database.create_table! :task.do 
  primary_key :id
  String :name
end

#sqlite
#/
#v
#CREATE TABLE 'task' (id INTEGER PRIMARY KEY, name varchar (255));