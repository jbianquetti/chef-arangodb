require 'minitest/spec' 
require File.expand_path('../support/helpers', __FILE__)

describe_recipe 'arangodb::repository' do
  include Helpers::Arangodb
  
  describe  "get GPG key" do
    it "gets GPG Key, and puts on Chef's cache file path" do 
      file("#{Chef::Config[:file_cache_path]}/RPM-GPG-KEY-www.arangodb.org").must_exist.with(:mode, "600").and(:owner, "root")
      end 
    end 
  
  describe "Add apt-key" do 
     it "added apt-key to trusted.gpg" do 
      #file("/etc/apt/trustdb.gpg").must_be_modified_after(run_status.start_time)
      file("/etc/apt/trustdb.gpg").must_exist
     end
  end

  describe "/etc/apt/sources.list.d/arangodb.list" do 
    it "creates sources archive" do
      file("/etc/apt/sources.list.d/arangodb.list").must_exist.with(:mode, "755").and(:owner, "root")
      file("/etc/apt/sources.list.d/arangodb.list").must_include 'www.arangodb.org/repositories'
    end
  end


end  
