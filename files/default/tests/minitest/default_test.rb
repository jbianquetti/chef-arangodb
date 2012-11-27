require 'minitest/spec' 
require File.expand_path('../support/helpers', __FILE__)

describe_recipe 'arangodb::default' do
  include Helpers::Arangodb
  
end  

