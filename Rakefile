require 'rake'
require 'rspec/core/rake_task'
require_relative 'db/config'
require_relative 'lib/sunlight_legislators_importer.rb'


desc "create the database"
task "db:create" do
  touch 'db/ar-sunlight-legislators.sqlite3'
end

desc "drop the database"
task "db:drop" do
  rm_f 'db/ar-sunlight-legislators.sqlite3'
end

desc "migrate the database (options: VERSION=x, VERBOSE=false, SCOPE=blog)."
task "db:migrate" do
  ActiveRecord::Migrator.migrations_paths << File.dirname(__FILE__) + 'db/migrate'
  ActiveRecord::Migration.verbose = ENV["VERBOSE"] ? ENV["VERBOSE"] == "true" : true
  ActiveRecord::Migrator.migrate(ActiveRecord::Migrator.migrations_paths, ENV["VERSION"] ? ENV["VERSION"].to_i : nil) do |migration|
    ENV["SCOPE"].blank? || (ENV["SCOPE"] == migration.scope)
  end
end

# desc "opens console"
# task "console" do
#   exec "irb -r ./app.rb"
# end

desc "populate the database with sample data"
task "db:populate" do
  SunlightLegislatorsImporter.import
end


# desc "load all files in app/models to irb"
# task "console" do
#   file_list = Dir[File.dirname(__FILE__) + "/app/models/*.rb"].map { |f| "-r #{f}" }
#   exec "irb #{file_list.join(' ')}"
# end
 
 
desc "generate new migration file"
task "generate:migration" do
  timestamp = Time.now.strftime('%Y%m%d%H%M%S')
  exec "touch db/migrate/#{timestamp}_#{ARGV.last}.rb"
end

desc "Run the specs"
RSpec::Core::RakeTask.new(:specs)

task :default  => :specs
