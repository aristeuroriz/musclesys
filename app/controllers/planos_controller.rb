class PlanosController < ApplicationController
  before_action :set_plano, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @planos = Plano.all
    respond_with(@planos)
  end

  def show
    respond_with(@plano)
  end

  def new
    @plano = Plano.new
    respond_with(@plano)
  end

  def edit
  end

  def create
    @plano = Plano.new(plano_params)
    @plano.save
    respond_with(@plano)
  end

  def update
    @plano.update(plano_params)
    respond_with(@plano)
  end

  def destroy
    @plano.destroy
    respond_with(@plano)
  end

  private
    def set_plano
      @plano = Plano.find(params[:id])
    end

    def plano_params
      params.require(:plano).permit(:desc_plano, :valor_plano, :promo_id)
    end
end
