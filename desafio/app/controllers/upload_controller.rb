class UploadController < ApplicationController

	def index
		
	end
	
	def uploadFile
		# cria o caminho físico do arquivo
		arquivo = params[:upload][:datafile]
		path = File.join(Rails.root, 
		  "public/data", arquivo.original_filename)

		# escreve o arquivo no local designado
		File.open(path, "wb") do |f| 
		  f.write(arquivo.read)
		end
		logger.info "Arquivo carregado com Sucesso"
		redirect_to root_url
	end

end
