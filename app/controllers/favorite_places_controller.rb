class FavoritePlacesController < ApplicationController

  def index
    @favorite_places = FavoritePlace.all
  end

  def show
  end

  def new
    @favorite_place = FavoritePlace.new
  end

  def create
    @favorite_place = FavoritePlace.new(favorite_place_params)

    render json: {}
    # respond_to do |format|
    #   if @favorite_place.save
    #     format.html { redirect_to @favorite_place, notice: 'A favorite place was successfully created.' }
    #     format.json { render action: 'show', status: :created, location: @favorite_place }
    #   else
    #     format.html { render action: 'new' }
    #     format.json { render json: @favorite_place.errors, status: :unprocessable_entity }
    #   end
    # end
  end


  def destroy
    @favorite_place = FavoritePlace.find(params[:id])
    @favorite_place.destroy

    respond_to do |format|
      format.html { redirect_to favorite_place_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_favorite_place
      @favorite_place = FavoritePlace.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def favorite_place_params
      params.permit(:user_id, :lat, :lon, :address, :id)
    end

end
