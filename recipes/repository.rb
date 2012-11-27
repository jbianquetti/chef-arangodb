
# download GPG key and save to Chef's cache path
# Not if file already been there 
remote_file "#{Chef::Config[:file_cache_path]+'/RPM-GPG-KEY-www.arangodb.org'}" do
  source "http://www.arangodb.org/repositories/PublicKey"
  owner "root"
  group "root"
  mode  "600"
  not_if { ::File.exists?("#{Chef::Config[:file_cache_path]}/RPM-GPG-KEY-www.arangodb.org") } 
end 

# Add that key to the keyring 
execute "apt-key add" do
  command "apt-key add #{Chef::Config[:file_cache_path]}/RPM-GPG-KEY-www.arangodb.org"
  not_if  "apt-key list | grep -q 8F44A84B"
end


# hardcoded version to work with my  development workstation (i386 - Ubuntu 10.04)
# ArangoDB has no i386 package for Ubuntu 10.04
ubu_release = "Ubuntu-12.10"

# hack to match lsb_release vs arangodb repo's names 
ubu_release = %x(lsb_release -irs).strip.sub( /\n/,'-')


file  "/etc/apt/sources.list.d/arangodb.list" do
  owner "root"
  group "root"
  mode "0755"
  content "deb http://www.arangodb.org/repositories/ #{ubu_release} main \n"
  action :create
end 
  
   



