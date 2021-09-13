require 'rails_helper'
require './spec/support/json_matcher'

describe 'Api::V1::Accounts', type: :request do
  shared_context 'make request' do
    subject(:start_date) { (Time.now - 10.minutes).strftime('%Y-%m-%dT%T') }
    subject(:end_date) { (Time.now + 10.minutes).strftime('%Y-%m-%dT%T') }
    subject(:account) do
      create(:account) { |account| create_list(:operation, 5, account: account) }
    end
    subject(:params) { { start_date: start_date, end_date: end_date } }
    subject(:url) { "/api/v1/accounts/#{account.id}/operations_by_range/" }

    before { get url, params: params }
  end

  describe 'GET accounts/:id/operations_by_range' do
    describe 'with correct parameters' do
      include_context 'make request'

      it 'should returns status 200' do
        expect(response).to have_http_status(200)
      end

      it 'should returns ten operations' do
        expect(JSON.parse(response.body).size).to eq(5)
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
        subject(:start_date) { (Time.now + 5.minutes).strftime('%Y-%m-%dT%T') }

        it 'should returns status 200' do
          expect(response).to have_http_status(200)
        end

        it 'should returns empty operations' do
          expect(JSON.parse(response.body)).to match_array([])
        end
      end
    end
  end
end
