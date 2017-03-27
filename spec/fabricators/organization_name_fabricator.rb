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

Fabricator :organization_name do
  content 'Gallery A'
end
