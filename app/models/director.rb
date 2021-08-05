# == Schema Information
#
# Table name: directors
#
#  id         :integer          not null, primary key
#  bio        :text
#  dob        :date
#  image      :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Director < ApplicationRecord
  has_many(:filmography, {:class_name => "Movie", :foreign_key => "director_id"})
  has_many(:actors, { :through => :filmography, :source => :cast })

  #def actors
  #  the_many = Array.new
  #  self.filmography.each do |joining_record|
  #    destination_record = joining_record.cast
  #    the_many.push(destination_record)
  #  end
  #  return the_many.flatten
  #end
  #has_many(:actors, {:through=>:filmography, :source=>:cast})
end
