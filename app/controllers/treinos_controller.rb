class TreinosController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :create, :update, :destroy]
  before_filter :authenticate_user!
  respond_to :html, :xml, :json


  def index
    @treinos  = Treino.where(:user_id=>current_user.id).order('grupo_muscular ASC')
    
  end

  def show
    @treino = Treino.where(:user_id=>current_user.id).find(params[:id])

  end

  def new
    @treino = Treino.new

  end

  def edit
    @treino = current_user.treinos.find(params[:id])
  end

  def create
    @treino = Treino.new(treino_params)
    @treino.user_id = current_user.id

    if @treino.save
      redirect_to @treino, notice: t('flash.notice.medida_created')
    else
      render action: "index"
    end
  end

  def update
    @treino = Treino.find(params[:id])

    if @treino.update(treino_params)
      redirect_to @treino, notice: t('flash.notice.medida_updated')
    else
      render action: "edit"
    end
  end

  def destroy
    @treino = Treino.find(params[:id])
    @treino.destroy
    redirect_to treinos_url
  end

  private
  def set_treino
    @treino = Treino.find(params[:id])
  end

  def treino_params
    params.require(:treino).permit(:grupo_muscular, :desc_exercicio, :carga, :serie, :repeticoes)
  end
end
