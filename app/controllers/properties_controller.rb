class PropertiesController < ApplicationController

  def index
    @properties = Property.all
  end

  def new
    @property = Property.new
    2.times{@property.nearest_stations.build}
  end

  def create
    @property = Property.new(property_params)
    if @property.save
      redirect_to properties_path
    else  
      render :new
    end
    # respond_to do |format|
    #   if @property.save
    #     format.html { redirect_to @property, notice: "Property was successfully created." }
    #     format.json { render :show, status: :created, location: @property }
    #   else
    #     format.html { render :new, status: :unprocessable_entity }
    #     format.json { render json: @property.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  def show
    @property = Property.find(params[:id])
  end

  def edit
    @property = Property.find(params[:id])
    @property.nearest_stations.build
  end

  def update
    @property = Property.find(params[:id])
    if @property.update(property_params)
      redirect_to properties_path 
    else 
      render :edit
    end
    # respond_to do |format|
    #   if @property.update(property_params)
    #     format.html { redirect_to @property, notice: "Property was successfully updated." }
    #     format.json { render :show, status: :ok, location: @property }
    #   else
    #     format.html { render :edit, status: :unprocessable_entity }
    #     format.json { render json: @property.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # DELETE /properties/1 or /properties/1.json
  def destroy
    @property = Property.find(params[:id])
    @property.destroy
    redirect_to properties_path
    # respond_to do |format|
    #   format.html { redirect_to properties_url, notice: "Property was successfully destroyed." }
    #   format.json { head :no_content }
    # end
  end

  private

    def property_params
      params.require(:property).permit(:property_name, :rent, :address, :building_age, :remark, nearest_stations_attributes:[:id, :line, :station_name, :walking_minutes])
    end

end
