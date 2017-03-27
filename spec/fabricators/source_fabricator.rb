# == Schema Information
#
# Table name: sources
#
#  id                     :integer          not null, primary key
#  name                   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  email_rank             :integer
#  location_rank          :integer
#  organization_name_rank :integer
#  phone_number_rank      :integer
#  website_rank           :integer
#

Fabricator :source do
  name { Fabricate.sequence(:name) { |i| "Source ##{i}" } }
  email_rank { Fabricate.sequence(:email_rank) }
  location_rank { Fabricate.sequence(:location_rank) }
  organization_name_rank { Fabricate.sequence(:organization_name_rank) }
  phone_number_rank { Fabricate.sequence(:phone_number_rank) }
  website_rank { Fabricate.sequence(:website_rank) }
end
