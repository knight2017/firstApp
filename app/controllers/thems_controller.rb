class ThemsController < ApplicationController
  before_action :set_them, only: [:show, :edit, :update, :destroy]

  # GET /thems
  # GET /thems.json
  def index
    @thems = Them.all
  end

  # GET /thems/1
  # GET /thems/1.json
  def show
  end

  # GET /thems/new
  def new
    @them = Them.new
  end

  # GET /thems/1/edit
  def edit
  end

  # POST /thems
  # POST /thems.json
  def create
    @them = Them.new(them_params)

    respond_to do |format|
      if @them.save
        format.html { redirect_to @them, notice: 'Them was successfully created.' }
        format.json { render :show, status: :created, location: @them }
      else
        format.html { render :new }
        format.json { render json: @them.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /thems/1
  # PATCH/PUT /thems/1.json
  def update
    respond_to do |format|
      if @them.update(them_params)
        format.html { redirect_to @them, notice: 'Them was successfully updated.' }
        format.json { render :show, status: :ok, location: @them }
      else
        format.html { render :edit }
        format.json { render json: @them.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /thems/1
  # DELETE /thems/1.json
  def destroy
    @them.destroy
    respond_to do |format|
      format.html { redirect_to thems_url, notice: 'Them was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_them
      @them = Them.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def them_params
      params.require(:them).permit(:name, :content)
    end
end
