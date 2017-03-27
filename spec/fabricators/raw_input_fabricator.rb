# == Schema Information
#
# Table name: raw_inputs
#
#  id            :integer          not null, primary key
#  import_id     :integer
#  output_id     :integer
#  output_type   :string
#  data          :json
#  state         :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  exception     :string
#  error_details :json
#

Fabricator :raw_input do
  import
end
