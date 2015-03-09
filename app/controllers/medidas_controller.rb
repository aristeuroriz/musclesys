class MedidasController < ApplicationController

  before_action :authenticate_user!, only: [:new, :edit, :create, :update, :destroy]
  before_filter :authenticate_user!
  respond_to :html, :xml, :json

  def index
    @medidas  = Medida.where(:user_id=>current_user.id).order('created_at DESC')
    
  end


 def show
  @medida = Medida.where(:user_id=>current_user.id).find(params[:id])
end

def new
  @medida = Medida.new

end

def edit

 @medida = current_user.medidas.find(params[:id])

end

def create

  @medida = Medida.new(medida_params)
  @medida.user_id = current_user.id


  if @medida.save
    redirect_to @medida, notice: t('flash.notice.medida_created')
  else
    render action: "index"
  end

end

def update

 @medida = Medida.find(params[:id])

 if @medida.update(medida_params)
  redirect_to @medida, notice: t('flash.notice.medida_updated')
else
  render action: "edit"
end
end

def destroy
  @medida = Medida.find(params[:id])
  @medida.destroy
  redirect_to medidas_url
end


private
def set_medida

  @medida = Medida.find(params[:id])

end

def medida_params
  params.require(:medida).permit(:data_medida, :peso, :torax, :ombro, :braco_d, :braco_e,
    :ante_braco_d, :ante_braco_e, :cintura, :quadril, :gluteo, :coxa_d, :coxa_e, :perna_d, :perna_e, :obs)
end
end

