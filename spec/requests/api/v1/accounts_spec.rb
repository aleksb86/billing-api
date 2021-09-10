require 'rails_helper'

RSpec.describe 'Api::V1::Accounts', type: :request do
  let(:start_date) { (Time.now - 10.minutes).strftime('%Y-%m-%dT%T') }
  let(:end_date) { (Time.now + 10.minutes).strftime('%Y-%m-%dT%T') }
  let(:account) do
    create(:account) do |account|
      create_list(:operation, 10, account: account)
    end
  end
  let(:params) { { start_date: start_date, end_date: end_date } }

  describe 'GET accounts/:id/operations_by_range' do
    before { get "/api/v1/accounts/#{account.id}/operations_by_range/", params: params }

    it 'returns status 200' do
      expect(response).to have_http_status(200)
    end

    it 'returns operations' do
      expect(JSON.parse(response.body).size).to eq(10)
    end
  end
end
