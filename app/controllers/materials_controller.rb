class MaterialsController < ApplicationController
  def create
    @material = Material.new(material_params)
    if @material.save
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
    end
  end

  private
  def material_params
    params.require(:material).permit(:name).merge(dish_id: params[:dish_id])
  end
end
