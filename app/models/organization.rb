# == Schema Information
#
# Table name: organizations
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Organization < ApplicationRecord
  has_many :emails
  has_many :locations
  has_many :organization_names
  has_many :organization_tags
  has_many :phone_numbers
  has_many :tags, through: :organization_tags
  has_many :websites

  has_paper_trail ignore: %i(created_at updated_at)
end
