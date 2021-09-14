# frozen_string_literal: true

module Api
  module V1
    class AccountsController < ApplicationController
      before_action :find_account, only: %i[update show destroy operations_by_range]

      MISSING_DATE_MESSAGE = 'start_time and end_time is required'

      def index
        as_json(Account.page(params[:page]).per(params[:per_page]), :ok)
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
        if params[:start_time].blank? || params[:end_time].blank?
          as_json({ error: MISSING_DATE_MESSAGE }, :bad_request)
        else
          start_time = params[:start_time]&.to_time
          end_time = params[:end_time]&.to_time
          result = Reports::OperationsReport.call(@account, start_time, end_time)
          render json: Operations::ReportPresenter.new(result).as_json
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
