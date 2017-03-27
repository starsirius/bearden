# == Schema Information
#
# Table name: imports
#
#  id          :integer          not null, primary key
#  source_id   :integer
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  transformer :string
#

class Import < ApplicationRecord
  belongs_to :source
  has_many :raw_inputs

  validates :source, presence: true
end
