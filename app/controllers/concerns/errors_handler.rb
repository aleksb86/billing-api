module ErrorsHandler
  extend ActiveSupport::Concern

  included do
    rescue_from ActionController::ParameterMissing do |e|
      as_json({ error: e.message }, :bad_request)
    end

    rescue_from ActiveRecord::RecordNotFound do |e|
      as_json({ error: e.message }, :not_found)
    end

    rescue_from ActiveRecord::RecordInvalid, ActiveRecord::RecordNotDestroyed do |e|
      as_json({ error: e.message }, :unprocessable_entity)
    end
  end
end
