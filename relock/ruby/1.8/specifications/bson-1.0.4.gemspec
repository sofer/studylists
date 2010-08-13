# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{bson}
  s.version = "1.0.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Jim Menard", "Mike Dirolf", "Kyle Banker"]
  s.date = %q{2010-07-13}
  s.description = %q{A Ruby BSON implementation for MongoDB. For more information about Mongo, see http://www.mongodb.org. For more information on BSON, see http://www.bsonspec.org.}
  s.email = %q{mongodb-dev@googlegroups.com}
  s.executables = ["b2json", "j2bson"]
  s.files = ["Rakefile", "bson.gemspec", "LICENSE.txt", "lib/bson.rb", "lib/bson/bson_c.rb", "lib/bson/bson_ruby.rb", "lib/bson/byte_buffer.rb", "lib/bson/exceptions.rb", "lib/bson/ordered_hash.rb", "lib/bson/types/binary.rb", "lib/bson/types/code.rb", "lib/bson/types/dbref.rb", "lib/bson/types/min_max_keys.rb", "lib/bson/types/objectid.rb", "bin/b2json", "bin/j2bson", "test/mongo_bson/basic_test.rb", "test/mongo_bson/binary_test.rb", "test/mongo_bson/bson_test.rb", "test/mongo_bson/byte_buffer_test.rb", "test/mongo_bson/jruby_bson_test.rb", "test/mongo_bson/jruby_encode_test.rb", "test/mongo_bson/json_test.rb", "test/mongo_bson/objectid_test.rb", "test/mongo_bson/ordered_hash_test.rb"]
  s.homepage = %q{http://www.mongodb.org}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Ruby implementation of BSON}
  s.test_files = ["test/mongo_bson/basic_test.rb", "test/mongo_bson/binary_test.rb", "test/mongo_bson/bson_test.rb", "test/mongo_bson/byte_buffer_test.rb", "test/mongo_bson/jruby_bson_test.rb", "test/mongo_bson/jruby_encode_test.rb", "test/mongo_bson/json_test.rb", "test/mongo_bson/objectid_test.rb", "test/mongo_bson/ordered_hash_test.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
