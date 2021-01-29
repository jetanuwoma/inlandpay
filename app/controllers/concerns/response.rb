# frozen_string_literal: true

module Response
  def json_response(message: 'Success', status: :ok, data: nil)
    render json: data,
           meta: message, meta_key: :message, status: status
  end
end