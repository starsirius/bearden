# == Schema Information
#
# Table name: emails
#
#  id              :integer          not null, primary key
#  organization_id :integer
#  content         :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

Fabricator :email do
  content { sequence(:email) { |i| "user#{i}@example.com" } }
end
