# frozen_string_literal: true

module Api
  module V1
    class AccountsController < ApplicationController
      before_action :find_account, only: %i[update show destroy operations_by_range]

      MISSING_DATE_MESSAGE = 'start_date and end_date is required'.freeze

      def index
        as_json(Account.all, :ok)
      end

      def show
        as_json(@account, :ok)
      end

      def create
        account = Account.new(account_params)
        if account.save
          as_json(account, :ok)
        else
          as_json({ error: account.errors }, :unprocessable_entity)
        end
      end

      def update
        if @account.update(account_params)
          as_json({ error: @account.errors }, :unprocessable_entity)
        else
          as_json(@account, :ok)
        end
      end

      def destroy
        @account.destroy
        head :no_content
      end

      def operations_by_range
        if params[:start_date].blank? || params[:end_date].blank?
          as_json({ error: MISSING_DATE_MESSAGE }, :bad_request)
        else
          start_date = params[:start_date]&.to_time
          end_date = params[:end_date]&.to_time
          result = Reports::OperationsReport.operations_by_period(@account, start_date, end_date)
          render json: Operations::ListPresenter.new(result).as_json
        end
      end

      private

      def find_account
        @account = Account.find(params[:id])
      end

      def account_params
        params.require(:account).permit(:code)
      end
    end
  end
end
