# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{mongoid}
  s.version = "2.0.0.beta.16"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.3.6") if s.respond_to? :required_rubygems_version=
  s.authors = ["Durran Jordan"]
  s.date = %q{2010-08-06}
  s.description = %q{Mongoid is an ODM (Object Document Mapper) Framework for MongoDB, written in Ruby.}
  s.email = ["durran@gmail.com"]
  s.files = ["lib/config/locales/en.yml", "lib/config/locales/es.yml", "lib/config/locales/fr.yml", "lib/config/locales/it.yml", "lib/config/locales/pl.yml", "lib/config/locales/pt.yml", "lib/config/locales/sv.yml", "lib/mongoid/associations/embedded_in.rb", "lib/mongoid/associations/embeds_many.rb", "lib/mongoid/associations/embeds_one.rb", "lib/mongoid/associations/foreign_key.rb", "lib/mongoid/associations/meta_data.rb", "lib/mongoid/associations/options.rb", "lib/mongoid/associations/proxy.rb", "lib/mongoid/associations/referenced_in.rb", "lib/mongoid/associations/references_many.rb", "lib/mongoid/associations/references_many_as_array.rb", "lib/mongoid/associations/references_one.rb", "lib/mongoid/associations.rb", "lib/mongoid/atomicity.rb", "lib/mongoid/attributes.rb", "lib/mongoid/callbacks.rb", "lib/mongoid/collection.rb", "lib/mongoid/collections/cyclic_iterator.rb", "lib/mongoid/collections/master.rb", "lib/mongoid/collections/operations.rb", "lib/mongoid/collections/slaves.rb", "lib/mongoid/collections.rb", "lib/mongoid/components.rb", "lib/mongoid/config.rb", "lib/mongoid/contexts/enumerable/sort.rb", "lib/mongoid/contexts/enumerable.rb", "lib/mongoid/contexts/ids.rb", "lib/mongoid/contexts/mongo.rb", "lib/mongoid/contexts/paging.rb", "lib/mongoid/contexts.rb", "lib/mongoid/criteria.rb", "lib/mongoid/criterion/complex.rb", "lib/mongoid/criterion/exclusion.rb", "lib/mongoid/criterion/inclusion.rb", "lib/mongoid/criterion/optional.rb", "lib/mongoid/criterion/selector.rb", "lib/mongoid/cursor.rb", "lib/mongoid/deprecation.rb", "lib/mongoid/dirty.rb", "lib/mongoid/document.rb", "lib/mongoid/errors/document_not_found.rb", "lib/mongoid/errors/invalid_collection.rb", "lib/mongoid/errors/invalid_database.rb", "lib/mongoid/errors/invalid_field.rb", "lib/mongoid/errors/invalid_options.rb", "lib/mongoid/errors/invalid_type.rb", "lib/mongoid/errors/mongoid_error.rb", "lib/mongoid/errors/too_many_nested_attribute_records.rb", "lib/mongoid/errors/unsupported_version.rb", "lib/mongoid/errors/validations.rb", "lib/mongoid/errors.rb", "lib/mongoid/extensions/array/accessors.rb", "lib/mongoid/extensions/array/assimilation.rb", "lib/mongoid/extensions/array/conversions.rb", "lib/mongoid/extensions/array/parentization.rb", "lib/mongoid/extensions/big_decimal/conversions.rb", "lib/mongoid/extensions/binary/conversions.rb", "lib/mongoid/extensions/boolean/conversions.rb", "lib/mongoid/extensions/date/conversions.rb", "lib/mongoid/extensions/datetime/conversions.rb", "lib/mongoid/extensions/false_class/equality.rb", "lib/mongoid/extensions/float/conversions.rb", "lib/mongoid/extensions/hash/accessors.rb", "lib/mongoid/extensions/hash/assimilation.rb", "lib/mongoid/extensions/hash/conversions.rb", "lib/mongoid/extensions/hash/criteria_helpers.rb", "lib/mongoid/extensions/hash/scoping.rb", "lib/mongoid/extensions/integer/conversions.rb", "lib/mongoid/extensions/nil/assimilation.rb", "lib/mongoid/extensions/object/conversions.rb", "lib/mongoid/extensions/objectid/conversions.rb", "lib/mongoid/extensions/proc/scoping.rb", "lib/mongoid/extensions/set/conversions.rb", "lib/mongoid/extensions/string/conversions.rb", "lib/mongoid/extensions/string/inflections.rb", "lib/mongoid/extensions/symbol/conversions.rb", "lib/mongoid/extensions/symbol/inflections.rb", "lib/mongoid/extensions/time_conversions.rb", "lib/mongoid/extensions/true_class/equality.rb", "lib/mongoid/extensions.rb", "lib/mongoid/extras.rb", "lib/mongoid/factory.rb", "lib/mongoid/field.rb", "lib/mongoid/fields.rb", "lib/mongoid/finders.rb", "lib/mongoid/hierarchy.rb", "lib/mongoid/identity.rb", "lib/mongoid/indexes.rb", "lib/mongoid/javascript/functions.yml", "lib/mongoid/javascript.rb", "lib/mongoid/json.rb", "lib/mongoid/keys.rb", "lib/mongoid/logger.rb", "lib/mongoid/matchers/all.rb", "lib/mongoid/matchers/default.rb", "lib/mongoid/matchers/exists.rb", "lib/mongoid/matchers/gt.rb", "lib/mongoid/matchers/gte.rb", "lib/mongoid/matchers/in.rb", "lib/mongoid/matchers/lt.rb", "lib/mongoid/matchers/lte.rb", "lib/mongoid/matchers/ne.rb", "lib/mongoid/matchers/nin.rb", "lib/mongoid/matchers/size.rb", "lib/mongoid/matchers.rb", "lib/mongoid/memoization.rb", "lib/mongoid/modifiers/command.rb", "lib/mongoid/modifiers/inc.rb", "lib/mongoid/modifiers.rb", "lib/mongoid/named_scope.rb", "lib/mongoid/paranoia.rb", "lib/mongoid/paths.rb", "lib/mongoid/persistence/command.rb", "lib/mongoid/persistence/insert.rb", "lib/mongoid/persistence/insert_embedded.rb", "lib/mongoid/persistence/remove.rb", "lib/mongoid/persistence/remove_all.rb", "lib/mongoid/persistence/remove_embedded.rb", "lib/mongoid/persistence/update.rb", "lib/mongoid/persistence.rb", "lib/mongoid/railtie.rb", "lib/mongoid/railties/database.rake", "lib/mongoid/railties/document.rb", "lib/mongoid/safe.rb", "lib/mongoid/safety.rb", "lib/mongoid/scope.rb", "lib/mongoid/state.rb", "lib/mongoid/timestamps.rb", "lib/mongoid/validations/associated.rb", "lib/mongoid/validations/uniqueness.rb", "lib/mongoid/validations.rb", "lib/mongoid/version.rb", "lib/mongoid/versioning.rb", "lib/mongoid.rb", "lib/rails/generators/mongoid/config/config_generator.rb", "lib/rails/generators/mongoid/config/templates/mongoid.yml", "lib/rails/generators/mongoid/model/model_generator.rb", "lib/rails/generators/mongoid/model/templates/model.rb", "lib/rails/generators/mongoid_generator.rb", "lib/rails/mongoid.rb", "MIT_LICENSE", "README.rdoc"]
  s.homepage = %q{http://mongoid.org}
  s.post_install_message = %q{   _________________________________
  |:::::::::::::::::::::::::::::::::| "I find your lack of faith disturbing."
  |:::::::::::::;;::::::::::::::::::|
  |:::::::::::'~||~~~``:::::::::::::| Mongoid 2 introduces
  |::::::::'   .':     o`:::::::::::| a different way of defining how
  |:::::::' oo | |o  o    ::::::::::| ids are stored on documents, as
  |::::::: 8  .'.'    8 o  :::::::::| well as how foreign key fields
  |::::::: 8  | |     8    :::::::::| and indexes are stored.
  |::::::: _._| |_,...8    :::::::::|
  |::::::'~--.   .--. `.   `::::::::| If you were using String
  |:::::'     =8     ~  \ o ::::::::| representations of BSON::ObjectIDs
  |::::'       8._ 88.   \ o::::::::| as your document ids, all of your
  |:::'   __. ,.ooo~~.    \ o`::::::| documents will now need to tell
  |:::   . -. 88`78o/:     \  `:::::| Mongoid to use Strings like so:
  |::'     /. o o \ ::      \88`::::|
  |:;     o|| 8 8 |d.        `8 `:::| class User
  |:.       - ^ ^ -'           `-`::|   include Mongoid::Document
  |::.                          .:::|   identity :type => String
  |:::::.....           ::'     ``::| end
  |::::::::-'`-        88          `|
  |:::::-'.          -       ::     | All ids will default to
  |:-~. . .                   :     | BSON:ObjectIDs from now on, and
  | .. .   ..:   o:8      88o       | Config#use_object_ids has been
  |. .     :::   8:P     d888. . .  | removed.
  |.   .   :88   88      888'  . .  |
  |   o8  d88P . 88   ' d88P   ..   | Foreign key fields for relational
  |  88P  888   d8P   ' 888         | associations no longer index by
  |   8  d88P.'d:8  .- dP~ o8       | default - you will need to pass
  |      888   888    d~ o888    LS | :index => true to the association
  |_________________________________| definition to have the field indexed

  or create the index manually, which is the preferred method. Note that
  if you were using String ids and now want to use object ids instead you
  will have to migrate your database manually - Mongoid cannot perform
  this for you automatically. If you were using custom composite keys,
  these will need to be defined as Strings since they cannot be converted.

  You can run a rake task to convert all your string object ids to ObjectID (thanks to Kyle Banker):

  rake db:mongoid:objectid_convert

  Your old collections will be backed up to their original names appended with "_old".
  If you verify your site is still working good with the ObjectIDs, you can clean them up using:

  rake db:mongoid:cleanup_old_collections

}
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{mongoid}
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Elegent Persistance in Ruby for MongoDB.}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<activemodel>, ["= 3.0.0.rc"])
      s.add_runtime_dependency(%q<tzinfo>, ["= 0.3.22"])
      s.add_runtime_dependency(%q<will_paginate>, ["~> 3.0.pre"])
      s.add_runtime_dependency(%q<mongo>, ["= 1.0.7"])
      s.add_runtime_dependency(%q<bson>, ["= 1.0.4"])
      s.add_development_dependency(%q<bson_ext>, ["= 1.0.4"])
      s.add_development_dependency(%q<mocha>, ["= 0.9.8"])
      s.add_development_dependency(%q<rspec>, ["= 2.0.0.beta.19"])
      s.add_development_dependency(%q<watchr>, ["= 0.6"])
      s.add_development_dependency(%q<ruby-debug-wrapper>, ["= 0.0.1"])
    else
      s.add_dependency(%q<activemodel>, ["= 3.0.0.rc"])
      s.add_dependency(%q<tzinfo>, ["= 0.3.22"])
      s.add_dependency(%q<will_paginate>, ["~> 3.0.pre"])
      s.add_dependency(%q<mongo>, ["= 1.0.7"])
      s.add_dependency(%q<bson>, ["= 1.0.4"])
      s.add_dependency(%q<bson_ext>, ["= 1.0.4"])
      s.add_dependency(%q<mocha>, ["= 0.9.8"])
      s.add_dependency(%q<rspec>, ["= 2.0.0.beta.19"])
      s.add_dependency(%q<watchr>, ["= 0.6"])
      s.add_dependency(%q<ruby-debug-wrapper>, ["= 0.0.1"])
    end
  else
    s.add_dependency(%q<activemodel>, ["= 3.0.0.rc"])
    s.add_dependency(%q<tzinfo>, ["= 0.3.22"])
    s.add_dependency(%q<will_paginate>, ["~> 3.0.pre"])
    s.add_dependency(%q<mongo>, ["= 1.0.7"])
    s.add_dependency(%q<bson>, ["= 1.0.4"])
    s.add_dependency(%q<bson_ext>, ["= 1.0.4"])
    s.add_dependency(%q<mocha>, ["= 0.9.8"])
    s.add_dependency(%q<rspec>, ["= 2.0.0.beta.19"])
    s.add_dependency(%q<watchr>, ["= 0.6"])
    s.add_dependency(%q<ruby-debug-wrapper>, ["= 0.0.1"])
  end
end
