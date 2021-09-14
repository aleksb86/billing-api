require 'rails_helper'
require './spec/support/json_matcher'

describe 'Api::V1::Accounts', type: :request do
  shared_context 'make request' do
    subject(:start_time) { Time.now }
    subject(:end_time) { start_time + 1.minute }
    subject(:account) do
      create(:account) { |account| create_list(:operation, 20, account: account) }
    end
    subject(:url) { "/api/v1/accounts/#{account.id}/operations_by_range/" }
    subject(:params) do
      {
        start_time: start_time.strftime('%Y-%m-%dT%T'),
        end_time: end_time.strftime('%Y-%m-%dT%T')
      }
    end

    before { get url, params: params }
  end

  describe 'GET accounts/:id/operations_by_range' do
    describe 'with correct parameters' do
      include_context 'make request'

      it 'should returns status 200' do
        expect(response).to have_http_status(200)
      end

      it 'should returns twenty operations' do
        expect(JSON.parse(response.body)['operations'].size).to eq(20)
      end

      it 'should match "operations_by_range" schema' do
        expect(response).to match_json_schema('operations_by_range')
      end
    end

    describe 'with INcorrect parameters' do
      include_context 'make request'

      context 'with not exists account' do
        subject(:account) { build :account }

        it 'should returns status 404' do
          expect(response).to have_http_status(404)
        end

        it 'should returns error' do
          expect(JSON.parse(response.body)).to have_key('error')
        end
      end

      context 'with missing start & end dates' do
        subject(:params) {}

        it 'should returns status 400' do
          expect(response).to have_http_status(400)
        end

        it 'should returns empty operations' do
          expect(JSON.parse(response.body)).to have_key('error')
        end
      end

      context 'with future time range' do
        subject(:start_time) { Time.now + 1.day }

        it 'should returns status 200' do
          expect(response).to have_http_status(200)
        end

        it 'should returns empty operations' do
          expect(response).to match_json_schema('operations_by_range_empty')
        end
      end
    end
  end
end
