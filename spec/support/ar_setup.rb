require 'mysql2' # loaded outside of bundler

ActiveRecord::Base.establish_connection(
  adapter:  "mysql2",
  host:     ENV["db_host"] || "127.0.0.1",
  username: ENV["db_user"] || "travis",
  password: ENV["db_pass"] || "",
  database: ENV["db"] || "myapp_test"
)
