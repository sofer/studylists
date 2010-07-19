class Exercise
  include Mongoid::Document
  field :phrase, :type => String
  field :response, :type => String

  embedded_in :topic, :inverse_of => :exercises

end
