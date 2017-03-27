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

Fabricator :phone_number do
  content '1-800-555-7777'
end
