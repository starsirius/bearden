# == Schema Information
#
# Table name: tags
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

Fabricator :tag do
  name { Fabricate.sequence(:tag_name) { |i| "tag ##{i}" } }
end
