$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "erp/saoee/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "erp_saoee"
  s.version     = Erp::Saoee::VERSION
  s.authors     = ["Ton Hung Nguyen"]
  s.email       = ["hungnt@hoangkhang.com.vn"]
  s.homepage    = "http://sao-ee.vn/"
  s.summary     = "Website Sao-EE.vn."
  s.description = "Website Sao-EE.vn."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails"
  s.add_dependency "erp_core"
  s.add_dependency "deface"
end
