include_recipe "apt"

ubu_release = %x(lsb_release -irs).strip.sub( /\n/,'-')

apt_repository "arangodb" do
  uri "http://www.arangodb.org/repositories/"
  components ["main"]
  distribution ubu_release
  key "http://www.arangodb.org/repositories/PublicKey" 
  action :add
end

# fails 'cause repo  don't have a i386 package
# Must works with x86-84 bits 
package "arangodb" do
  action :upgrade
end 
