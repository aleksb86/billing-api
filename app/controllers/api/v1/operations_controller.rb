module Api
  module V1
    class OperationsController < ApplicationController
      before_action :find_operation, only: [:update, :show, :destroy]

      def index
        as_json(Operation.all, :ok)
      end

      def show
        as_json(@operation, :ok)
      end

      # TODO создание записи операции можно вынести в сервисный класс (если усложнится в будущем)
      def create
        account = Account.find(operation_params[:account_id])
        operation_name = OperationName.find(operation_params[:operation_name_id])
        operation = Operation.new(
          amount: operation_params[:amount],
          operation_name: operation_name,
          account: account
        )
        if operation.save
          as_json(operation, :ok)
        else
          as_json({ error: operation.errors }, :unprocessable_entity)
        end
      end

      # TODO изменение операции также можно вынести в сервисный класс (что-то вроде OperationUpdater)
      def update
        if @operation.update(params_for_update)
          as_json(@operation, :ok)
        else
          as_json({ error: @operation.errors }, :unprocessable_entity)
        end
      end

      def destroy
        @operation.destroy
        head :no_content
      end

      private

      def find_operation
        @operation = Operation.find(params[:id])
      end

      def operation_params
        params.require(:operation).permit(:amount, :operation_name_id, :account_id)
      end

      def params_for_update
        data_for_update = {}
        data_for_update[:account] = Account.find(operation_params[:account_id]) if operation_params[:account_id].present?
        data_for_update[:operation_name] = OperationName.find(operation_params[:operation_name_id]) if operation_params[:operation_name_id].present?
        data_for_update[:amount] = operation_params[:amount] if operation_params[:amount].present?
        data_for_update
      end
    end
  end
end
