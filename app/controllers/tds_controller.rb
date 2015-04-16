class TdsController < ApplicationController
  def index
    @tds = Td.all
    if params[:hidden].present? && params[:hidden]=="cgstat"
      @up = Td.find(params[:id])
      if @up.update(params.permit(:name, :status))
        redirect_to root_path
      end
    elsif params[:find].present?
      @tds = @tds.where("status=?",params[:find])
    elsif params[:name].present?
      @td = Td.new(params.permit(:name,:status))
      if @td.save
        redirect_to root_path
      end
    end
  end
  def destroy
    @d = Td.find(params[:id])
    @d.destroy
    redirect_to root_path
  end
  def edit
    @ed = Td.find(params[:id])
  end
  def update
    @up = Td.find(params[:id])
    if @up.update(params.require(:td).permit(:name))
      redirect_to root_path
    else
      render :edit
    end
  end
end
