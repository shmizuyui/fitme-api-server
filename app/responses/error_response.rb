class ErrorResponse
  class << self
    def base_response(error, status)
      {
        data: nil,
        error:,
        status:
      }
    end
  end
end
