class Api::V1::PinsController < ApplicationController
  before_action :restrict_access, only: [:create]

  def index
    render json: Pin.all.order('created_at DESC')
  end

  def create
    pin = Pin.new(pin_params)
    if pin.save
      render json: pin, status: 201
    else
      render json: { errors: pin.errors }, status: 422
    end
  end

  private
    def pin_params
      params.require(:pin).permit(:title, :image_url)
    end

    def restrict_access
      
      email = request.headers['X-User-Email']
      token = request.headers['X-Api-Token']

      #authenticate_or_request_with_http_token do |token, options|
      #  User.find_by(api_token: token,email: email).present?
      #end
      @current_user = User.where(email: email)
      unless @current_user && @current_user.api_token == token
        head 401
      end


    end

end