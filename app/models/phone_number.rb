# == Schema Information
#
# Table name: phone_numbers
#
#  id              :integer          not null, primary key
#  organization_id :integer
#  content         :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class PhoneNumber < ApplicationRecord
  belongs_to :organization
  validates :content, presence: true
  has_paper_trail ignore: %i(created_at updated_at)
  include Rankable
end
