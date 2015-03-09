class AcademiaController < ApplicationController
  before_action :set_academium, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @academia = Academium.all
    respond_with(@academia)
  end

  def show
    respond_with(@academium)
  end

  def new
    @academium = Academium.new
    respond_with(@academium)
  end

  def edit
  end

  def create
    @academium = Academium.new(academium_params)
    @academium.save
    respond_with(@academium)
  end

  def update
    @academium.update(academium_params)
    respond_with(@academium)
  end

  def destroy
    @academium.destroy
    respond_with(@academium)
  end

  private
    def set_academium
      @academium = Academium.find(params[:id])
    end

    def academium_params
      params.require(:academium).permit(:nome_acad, :localidade, :instrutor)
    end
end
