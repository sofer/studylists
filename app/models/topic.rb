class Topic
  include Mongoid::Document
  field :name, :type => String
  field :case_sensitive, :type => Boolean
  field :ignore_punctuation, :type => String

  embeds_many :exercises
  embedded_in :subject, :inverse_of => :topic

end
