# == Schema Information
#
# Table name: exercises
#
#  id   :integer          not null, primary key
#  name :string
#

class Exercise < ActiveRecord::Base
  validates_uniqueness_of :name
end
