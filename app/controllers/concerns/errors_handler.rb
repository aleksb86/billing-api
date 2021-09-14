# frozen_string_literal: true

module ErrorsHandler
  extend ActiveSupport::Concern

  UNPROCESSABLE_EXCEPTIONS = [
    ActiveRecord::DeleteRestrictionError,
    ActiveRecord::RecordInvalid,
    ActiveRecord::RecordNotDestroyed
  ].freeze

  included do
    rescue_from ActionController::ParameterMissing do |e|
      as_json({ error: e.message }, :bad_request)
    end

    rescue_from ActiveRecord::RecordNotFound do |e|
      as_json({ error: e.message }, :not_found)
    end

    rescue_from(*UNPROCESSABLE_EXCEPTIONS) do |e|
      as_json({ error: e.message }, :unprocessable_entity)
    end
  end
end
