module Api
  module V1
    class OperationsController < ApplicationController
      before_action :find_operation, only: %i[update show destroy]

      def index
        as_json(Operation.page(params[:page]).per(params[:per_page]), :ok)
      end

      def show
        as_json(@operation, :ok)
      end

      def create
        operation = Operation.new(operation_params)
        if operation.save
          as_json(operation, :ok)
        else
          as_json({ error: operation.errors }, :unprocessable_entity)
        end
      end

      def update
        if @operation.update(operation_params)
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
    end
  end
end
