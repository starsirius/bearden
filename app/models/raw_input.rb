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

class RawInput < ApplicationRecord
  belongs_to :import

  CREATED = 'created'.freeze
  UPDATED = 'updated'.freeze
  ERROR = 'error'.freeze

  def transform
    import.transformer.constantize.transform self
  end

  def record_result(state, output)
    update_attributes(
      state: state,
      output_id: output.id,
      output_type: output.class
    )
  end

  def record_error(error, error_details)
    update_attributes(
      state: ERROR,
      exception: error.class,
      error_details: error_details
    )
  end
end
