# == Schema Information
#
# Table name: movies
#
#  id          :integer          not null, primary key
#  description :text
#  duration    :integer
#  image       :string
#  title       :string
#  year        :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  director_id :integer
#
class Movie < ApplicationRecord
  has_many(:characters, { :class_name => "Character", :foreign_key => "movie_id" })
  belongs_to(:director, { :class_name => "Director", :foreign_key => "director_id" })
  has_many(:cast, { :through => :characters, :source => :actor })

  #def cast
  #  the_many = Array.new
  #  self.characters.each do |joining_record|
  #    destination_record = joining_record.actor
  #    the_many.push(destination_record)
  #  end
  #  return the_many.flatten
  #end
  # equivalent to above method
  #has_many(:cast, {:through => :characters, :source => :actor})
end
