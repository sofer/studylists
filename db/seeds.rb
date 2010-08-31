# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

Subject.delete_all

subject = Subject.create :name => 'French'
numbers_topic = subject.topics.create :name => 'Numbers', :case_sensitive => false, :ignore_punctuation => true
number_exercises = [
  { 
    :phrase => 'un',
    :response => 'one'
  },
  { 
    :phrase => 'deux',
    :response => 'two'
  },
  { 
    :phrase => 'trois',
    :response => 'three'
  },
  { 
    :phrase => 'quatre',
    :response => 'four'
  },
  { 
    :phrase => 'cinq',
    :response => 'five'
  },
  { 
    :phrase => 'six',
    :response => 'six'
  },
  { 
    :phrase => 'sette',
    :response => 'seven'
  },
  { 
    :phrase => 'huit',
    :response => 'eight'
  },
  { 
    :phrase => 'neuf',
    :response => 'nine'
  },
  { 
    :phrase => 'dix',
    :response => 'ten'
  }
]
number_exercises.each do |ex|
  numbers_topic.exercises.create :phrase => ex[:phrase], :response => ex[:response]
end
puts "added #{numbers_topic.name} with exercises to #{subject.name}" 

people_topic = subject.topics.create :name => 'People', :case_sensitive => false, :ignore_punctuation => true
people_exercises = [
  { 
    :phrase => 'homme',
    :response => 'man'
  },
  { 
    :phrase => 'femme',
    :response => 'woman'
  },
  { 
    :phrase => 'garçon',
    :response => 'boy'
  },
  { 
    :phrase => 'fille',
    :response => 'girl'
  }
]
people_exercises.each do |ex|
  people_topic.exercises.create :phrase => ex[:phrase], :response => ex[:response]
end
puts "added #{people_topic.name} with exercises to #{subject.name}"

subject = Subject.create :name => 'Italian'
number_topic = subject.topics.create :name => 'Numbers', :case_sensitive => false, :ignore_punctuation => true
number_exercises = [
  { 
    :phrase => 'uno',
    :response => 'one'
  },
  { 
    :phrase => 'due',
    :response => 'two'
  },
  { 
    :phrase => 'tre',
    :response => 'three'
  },
  { 
    :phrase => 'quattro',
    :response => 'four'
  }
]
number_exercises.each do |ex|
  number_topic.exercises.create :phrase => ex[:phrase], :response => ex[:response]
end
puts "added #{number_topic.name} with exercises to #{subject.name}"


