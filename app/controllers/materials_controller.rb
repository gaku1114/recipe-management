class MaterialsController < ApplicationController
  def create
    material = Material.create(material_params)
    render json:{ material: material }
  end

  def destroy
    material = Material.find(params[:id])
    material.destroy
    redirect_back(fallback_location: root_path)
  end

  private
  def material_params
    params.require(:material).permit(:name).merge(dish_id: params[:dish_id])
  end
end
