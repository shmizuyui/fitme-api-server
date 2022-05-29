class ErrorResponse
  class << self
    def base_response(error, status)
      {
        data: nil,
        error: error,
        status: status
      }
    end
  end
end
