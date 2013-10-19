class TreasuresController < ApplicationController
  before_action :set_treasure, only: [:show, :edit, :update, :destroy]
  before_action :load_railscasts, only: [:new, :create, :edit, :update]

  # GET /treasures
  # GET /treasures.json
  def index
    if params[:tag]
      @treasures = Treasure.tagged_with(params[:tag])
    else
      @treasures = Treasure.all
    end
  end

  # GET /treasures/1
  # GET /treasures/1.json
  def show
  end

  # GET /treasures/new
  def new
    @treasure = Treasure.new
  end

  # GET /treasures/1/edit
  def edit
  end

  # POST /treasures
  # POST /treasures.json
  def create
    @treasure = Treasure.new(treasure_params)

    respond_to do |format|
      if @treasure.save
        format.html { redirect_to @treasure, notice: 'Treasure was successfully created.' }
        format.json { render action: 'show', status: :created, location: @treasure }
      else
        format.html { render action: 'new' }
        format.json { render json: @treasure.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /treasures/1
  # PATCH/PUT /treasures/1.json
  def update
    respond_to do |format|
      if @treasure.update(treasure_params)
        format.html { redirect_to @treasure, notice: 'Treasure was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @treasure.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /treasures/1
  # DELETE /treasures/1.json
  def destroy
    @treasure.destroy
    respond_to do |format|
      format.html { redirect_to treasures_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_treasure
      @treasure = Treasure.find(params[:id])
    end

    def load_railscasts
      @railscasts = Railscast.all
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def treasure_params
      params.require(:treasure).permit(:description, :railscast_id, :time, :tag_list)
    end
end
