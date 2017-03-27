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

Fabricator :website do
  content { Fabricate.sequence(:website) { |i| "https://example#{i}.com" } }
end
