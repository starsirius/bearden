# == Schema Information
#
# Table name: websites
#
#  id              :integer          not null, primary key
#  organization_id :integer
#  content         :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Website < ApplicationRecord
  belongs_to :organization
  validates :organization, presence: true
  validates :content, presence: true, uniqueness: true
  validates_format_of :content, with: /\./
  has_paper_trail ignore: %i(created_at updated_at)
  include Rankable
end
