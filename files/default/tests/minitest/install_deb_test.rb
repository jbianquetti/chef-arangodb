require 'minitest/spec' 
require File.expand_path('../support/helpers', __FILE__)

describe_recipe 'arangodb::install_deb' do
  include Helpers::Arangodb
   describe "resource apt_repository" do 
    it "creates sources archive" do
      file("/etc/apt/sources.list.d/arangodb-source.list").must_include 'www.arangodb.org/repositories'
    end
  end
   describe "resource package" do 
    it "package arangodb must be installed" do
      package("arangodb").must_be_installed 
    end
   end 


end  
