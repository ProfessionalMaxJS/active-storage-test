class ImagesController < ApplicationController
  # before_action :set_image, only: [:show, :update, :destroy]

  
  # GET /images
  def index
    @images = Image.all
    
    render json: @images
  end
  
  # GET /images/1
  def show
    image = Image.find(params[:id])
    render json: image
  end

  def create
    # byebug
    image = Image.create(image_params)
    render json: {image: image}
  end

  private

  def image_params
    params.permit(:caption, :picture)
  end

  # def pictured(image)
  #   if image.picture.attached?
  #     {
    #       url: rails_blob_url(image.picture)
    #     }
    #   end
  # end
  
end
  

  # # POST /images
  # def create
  #   @image = Image.new(image_params)

  #   if @image.save
  #     render json: @image, status: :created, location: @image
  #   else
  #     render json: @image.errors, status: :unprocessable_entity
  #   end
  # end

  # # PATCH/PUT /images/1
  # def update
  #   if @image.update(image_params)
  #     render json: @image
  #   else
  #     render json: @image.errors, status: :unprocessable_entity
  #   end
  # end

  # # DELETE /images/1
  # def destroy
  #   @image.destroy
  # end

  # private
  #   # Use callbacks to share common setup or constraints between actions.
  #   def set_image
  #     @image = Image.find(params[:id])
  #   end

  #   # Only allow a list of trusted parameters through.
  #   def image_params
  #     params.require(:image).permit(:caption, :storage_loc)
  #   end
