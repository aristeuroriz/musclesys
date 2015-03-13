class PainelController < ApplicationController

	before_action :authenticate_user!, only: [:show]
	before_filter :authenticate_user!

	def index

		t = Time.now
		t.strftime("%m/%Y")

		m4  = Medida.limit(4).where(:user_id=>current_user.id).order('data_medida ASC')
		gon.m1 = Medida.where(:user_id=>current_user.id).first
		altura = current_user.stature
		

		if gon.m1 == nil
			redirect_to medidas_path, :alert => "Para ver suas estatísticas você precisa ter medidas cadastradas."
		else
			gon.imc = (((m4.map(&:peso).last)/(altura**2))*10000).round(1)
			# Últimos dados

			lastData = Medida.where(:user_id=>current_user.id).last

			gon.data = (lastData.data_medida).strftime("%d/%m/%Y")
			gon.torax = lastData.torax
			gon.bracos = ((lastData.braco_d + lastData.braco_e)/2) + ((lastData.ante_braco_d) + (lastData.ante_braco_e)/2)
			gon.cintura = lastData.cintura
			gon.pernas = ((lastData.coxa_d + lastData.coxa_e)/2) + ((lastData.perna_d) + (lastData.perna_e)/2)
			gon.peso = lastData.peso
			gon.quadril = lastData.quadril

			# Fim últimos dados

			# Dados seriados por últimos quatro meses

			gon.data1 = (m4.map(&:data_medida).first).strftime("%d/%m/%Y")
			gon.torax1 = m4.map(&:torax).first
			gon.bracos1 = (((m4.map(&:braco_d).first) + (m4.map(&:braco_e).first))/2)
			gon.cintura1 = m4.map(&:cintura).first
			gon.pernas1 = (((m4.map(&:coxa_d).first) + (m4.map(&:coxa_e).first))/2) + (((m4.map(&:perna_d).first) + (m4.map(&:perna_e).first))/2)
			gon.peso1 = m4.map(&:peso).first
			gon.quadril1 = m4.map(&:quadril).first
		end

		if m4.map(&:data_medida).second == nil
			gon.data2 = '01/01/1800'
		else
			gon.data2 = (m4.map(&:data_medida).second).strftime("%d/%m/%Y")
			gon.torax2 = m4.map(&:torax).second
			gon.bracos2 = (((m4.map(&:braco_d).second) + (m4.map(&:braco_e).second))/2)
			gon.cintura2 = m4.map(&:cintura).second
			gon.pernas2 = (((m4.map(&:coxa_d).second) + (m4.map(&:coxa_e).second))/2) + (((m4.map(&:perna_d).second) + (m4.map(&:perna_e).second))/2)
			gon.peso2 = m4.map(&:peso).second
			gon.quadril2 = m4.map(&:quadril).second
		end

		if m4.map(&:data_medida).third == nil
			gon.data3 = '01/01/1800'
		else
			gon.data3 = (m4.map(&:data_medida).third).strftime("%d/%m/%Y")
			gon.torax3 = m4.map(&:torax).third
			gon.bracos3 = (((m4.map(&:braco_d).third) + (m4.map(&:braco_e).third))/2)
			gon.cintura3 = m4.map(&:cintura).third
			gon.pernas3 = (((m4.map(&:coxa_d).third) + (m4.map(&:coxa_e).third))/2) + (((m4.map(&:perna_d).third) + (m4.map(&:perna_e).third))/2)
			gon.peso3 = m4.map(&:peso).third
			gon.quadril3 = m4.map(&:quadril).third
		end

		if m4.map(&:data_medida).fourth == nil
			gon.data4 = '01/01/1800'
		else
			gon.data4 = (m4.map(&:data_medida).fourth).strftime("%d/%m/%Y")
			gon.torax4 = m4.map(&:torax).fourth
			gon.bracos4 = (((m4.map(&:braco_d).fourth) + (m4.map(&:braco_e).fourth))/2)
			gon.cintura4 = m4.map(&:cintura).fourth
			gon.pernas4 = (((m4.map(&:coxa_d).fourth) + (m4.map(&:coxa_e).fourth))/2) + (((m4.map(&:perna_d).fourth) + (m4.map(&:perna_e).fourth))/2)
			gon.peso4 = m4.map(&:peso).fourth
			gon.quadril1 = m4.map(&:quadril).fourth
		end
		#Fim dados seriados últimos quatro meses

	end

	private
	def set_medida

		@medida = Medida.find(params[:id])

	end

	def medida_params
		params.require(:medida).permit(:data_medida, :peso, :torax, :ombro, :braco_d, :braco_e,
			:ante_braco_d, :ante_braco_e, :cintura, :quadril, :coxa_d, :coxa_e, :perna_d, :perna_e, :obs)
	end


end
