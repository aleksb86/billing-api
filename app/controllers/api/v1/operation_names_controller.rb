module Api
  module V1
    class OperationNamesController < ApplicationController
      before_action :find_operation_name, only: %i[update show destroy]

      def index
        as_json(OperationName.page(params[:page]).per(params[:per_page]), :ok)
      end

      def show
        as_json(@operation_name, :ok)
      end

      def create
        operation_name = OperationName.new(operation_name_params)
        if operation_name.save
          as_json(operation_name, :ok)
        else
          as_json({ error: operation_name.errors }, :unprocessable_entity)
        end
      end

      def update
        if @operation_name.update(operation_name_params)
          as_json(@operation_name, :ok)
        else
          as_json({ error: @operation_name.errors }, :unprocessable_entity)
        end
      end

      def destroy
        @operation_name.destroy
        head :no_content
      end

      private

      def find_operation_name
        @operation_name = OperationName.find(params[:id])
      end

      def operation_name_params
        params.require(:operation_name).permit(:name)
      end
    end
  end
end
