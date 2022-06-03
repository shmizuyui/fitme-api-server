class ApiResponse
  class << self
    def base_response(data, error, status)
      {
        data:,
        error:,
        status:
      }
    end
  end
end
