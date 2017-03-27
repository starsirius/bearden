# == Schema Information
#
# Table name: sources
#
#  id                     :integer          not null, primary key
#  name                   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  email_rank             :integer
#  location_rank          :integer
#  organization_name_rank :integer
#  phone_number_rank      :integer
#  website_rank           :integer
#

class Source < ApplicationRecord
  class UnknownRankable < StandardError; end
  has_many :imports

  validates :name, presence: true, uniqueness: true
  validates :email_rank, presence: true, uniqueness: true
  validates :location_rank, presence: true, uniqueness: true
  validates :organization_name_rank, presence: true, uniqueness: true
  validates :phone_number_rank, presence: true, uniqueness: true
  validates :website_rank, presence: true, uniqueness: true

  def rank_for(rankable)
    case rankable
    when Email then email_rank
    when Location then location_rank
    when OrganizationName then organization_name_rank
    when PhoneNumber then phone_number_rank
    when Website then website_rank
    else raise UnknownRankable
    end
  end
end
