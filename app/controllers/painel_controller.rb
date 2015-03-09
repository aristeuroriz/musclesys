class PainelController < ApplicationController

	before_action :authenticate_user!, only: [:show]
	before_filter :authenticate_user!

	def index

		t = Time.now
		t.strftime("%m/%Y")

		m4  = Medida.limit(4).where(:user_id=>current_user.id).order('data_medida ASC')
		gon.m1 = Medida.where(:user_id=>current_user.id).first


		if gon.m1 == nil
			redirect_to medidas_path, :alert => "Para ver sua evolução você precisa ter medidas cadastradas!"
		else
			gon.data1 = (m4.map(&:data_medida).first).strftime("%d/%m/%Y")
			gon.torax1 = m4.map(&:torax).first
			gon.bracos1 = (((m4.map(&:braco_d).first) + (m4.map(&:braco_e).first))/2)
			gon.cintura1 = m4.map(&:cintura).first
			gon.pernas1 = (((m4.map(&:coxa_d).first) + (m4.map(&:coxa_e).first))/2)
		end

		if m4.map(&:data_medida).second == nil
			gon.data2 = '01/01/1800'
		else
			gon.data2 = (m4.map(&:data_medida).second).strftime("%d/%m/%Y")
			gon.torax2 = m4.map(&:torax).second
			gon.bracos2 = (((m4.map(&:braco_d).second) + (m4.map(&:braco_e).second))/2)
			gon.cintura2 = m4.map(&:cintura).second
			gon.pernas2 = (((m4.map(&:coxa_d).second) + (m4.map(&:coxa_e).second))/2)
		end

		if m4.map(&:data_medida).third == nil
			gon.data3 = '01/01/1800'
		else
			gon.data3 = (m4.map(&:data_medida).third).strftime("%d/%m/%Y")
			gon.torax3 = m4.map(&:torax).third
			gon.bracos3 = (((m4.map(&:braco_d).third) + (m4.map(&:braco_e).third))/2)
			gon.cintura3 = m4.map(&:cintura).third
			gon.pernas3 = (((m4.map(&:coxa_d).third) + (m4.map(&:coxa_e).third))/2)
		end

		if m4.map(&:data_medida).fourth == nil
			gon.data4 = '01/01/1800'
		else
			gon.data4 = (m4.map(&:data_medida).fourth).strftime("%d/%m/%Y")
			gon.torax4 = m4.map(&:torax).fourth
			gon.bracos4 = (((m4.map(&:braco_d).fourth) + (m4.map(&:braco_e).fourth))/2)
			gon.cintura4 = m4.map(&:cintura).fourth
			gon.pernas4 = (((m4.map(&:coxa_d).fourth) + (m4.map(&:coxa_e).fourth))/2)
		end

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
