# == Schema Information
#
# Table name: locations
#
#  id              :integer          not null, primary key
#  organization_id :integer
#  latitude        :float
#  longitude       :float
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  content         :string
#

class Location < ApplicationRecord
  belongs_to :organization
  validates :content, presence: true
  has_paper_trail ignore: %i(created_at updated_at)
  include Rankable

  def geocoded?
    latitude.present? && longitude.present?
  end

  def geocodable?
    content? && !geocoded?
  end
end
