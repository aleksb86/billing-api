module ResponseHandler
  def as_json(entity, http_status)
    render json: entity, status: http_status
  end
end
