# == Schema Information
#
# Table name: organization_names
#
#  id              :integer          not null, primary key
#  organization_id :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  content         :string
#

class OrganizationName < ApplicationRecord
  belongs_to :organization

  validates :content, presence: true
  validates_uniqueness_of :content, scope: :organization

  has_paper_trail ignore: %i(created_at updated_at)
  include Rankable
end
