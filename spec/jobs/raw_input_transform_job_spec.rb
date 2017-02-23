require 'rails_helper'

describe RawInputTransformJob do
  describe '#perform' do
    context 'with a new record' do
      it 'creates that record and records the result' do
        source = Fabricate :source
        import = Fabricate(:import,
                           source: source,
                           transformer: CsvTransformer)
        data = {
          location: '123 Main Street, New York, NY 10001',
          latitude: '47.5543105',
          longitude: '7.598538899999999',
          organization_name: 'Best Gallery',
          website: 'http://example.com'
        }
        raw_input = Fabricate :raw_input, import: import, data: data
        RawInputTransformJob.new.perform raw_input.id

        expect(Organization.count).to eq 1
        organization = Organization.first
        expect(organization.versions.first.actor).to eq raw_input

        expect(Location.count).to eq 1
        location = Location.first
        expect(location.versions.first.actor).to eq raw_input

        expect(Website.count).to eq 1
        website = Location.first
        expect(website.versions.first.actor).to eq raw_input

        expect(OrganizationName.count).to eq 1
        name = OrganizationName.first
        expect(name.versions.first.actor).to eq raw_input

        expect(raw_input.reload.output_id).to eq organization.id
        expect(raw_input.output_type).to eq organization.class.to_s
        expect(raw_input.result).to eq 'created'

        expect(PaperTrail.whodunnit).to eq 'Test User'
      end
    end
  end
end
