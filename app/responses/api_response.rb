class ApiResponse
  class << self
    def base_response(data, error, status)
      {
        data: data,
        error: error,
        status: status,
      }
    end
  end
end
