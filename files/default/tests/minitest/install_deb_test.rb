require 'minitest/spec' 
require File.expand_path('../support/helpers', __FILE__)

describe_recipe 'arangodb::installdeb' do
  include Helpers::Arangodb
   describe "/etc/apt/sources.list.d/arangodb-source.list" do 
    it "creates sources archive" do
      file("/etc/apt/sources.list.d/arangodb-source.list").must_include 'www.arangodb.org/repositories'
    end
  end


end  
