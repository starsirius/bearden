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

Fabricator :location do
  content '123 Main Street, New York, NY 10001'
  latitude '10'
  longitude '20'
end
