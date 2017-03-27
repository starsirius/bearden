# == Schema Information
#
# Table name: organization_tags
#
#  id              :integer          not null, primary key
#  tag_id          :integer
#  organization_id :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

Fabricator :organization_tag do
  tag { Fabricate :tag }
end
