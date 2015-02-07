class ComprasController < ApplicationController
  before_action :set_compra, only: [:show, :edit, :update, :destroy]

  # GET /compras
  # GET /compras.json
  def index
    @compras = Compra.all
    @receitabruta = 0
    @compras.each do |c|
		@receitabruta += (c.preco * c.quantidade)
    end
  end

  # GET /compras/1
  # GET /compras/1.json
  def show
  end

  # GET /compras/new
  def new
    @compra = Compra.new
  end

  # GET /compras/1/edit
  def edit
  end

  # POST /compras
  # POST /compras.json
  def create
    @compra = Compra.new(compra_params)

    respond_to do |format|
      if @compra.save
        format.html { redirect_to @compra, notice: "Compra ID #{@compra.id} foi criada com sucesso." }
        format.json { render :show, status: :created, location: @compra }
      else
        format.html { render :new }
        format.json { render json: @compra.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /compras/1
  # PATCH/PUT /compras/1.json
  def update
    respond_to do |format|
      if @compra.update(compra_params)
        format.html { redirect_to @compra, notice: "Compra ID #{@compra.id } foi atualizada com sucesso." }
        format.json { render :show, status: :ok, location: @compra }
      else
        format.html { render :edit }
        format.json { render json: @compra.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /compras/1
  # DELETE /compras/1.json
  def destroy
    @compra.destroy
    respond_to do |format|
      format.html { redirect_to compras_url, notice: "Compra ID #{@compra.id} foi removida com sucesso." }
      format.json { head :no_content }
    end
  end

  def upload_file	
	# cria o caminho físico do arquivo
	arquivo = params[:upload][:datafile] rescue nil
	caminho = File.join(Rails.root, 
	  "public/data", arquivo.original_filename)
	logger.info arquivo.inspect
	logger.info flash.inspect  
	if arquivo.content_type != "text/plain"
		logger.info "Arquivo '#{arquivo.original_filename}' não é um arquivo válido"
		respond_to do |format|
			format.html { redirect_to compras_url, alert: "Arquivo '#{arquivo.original_filename}' não é um arquivo válido. Somente Arquivos 'text/plain' são válidos." }
		end		
	else
		# escreve o arquivo no local designado
		File.open(caminho, "wb") do |f| 
		  f.write(arquivo.read)	  
		end
		leitura = File.open(caminho, "a+")	
		contador = 0	
		leitura.each_line do |linha|
			contador+=1
			next if (contador == 1)
			r = linha.match(/^(?<comprador>[^\t]+)\t(?<desc>[^\t]+)\t(?<preco>[^\t]+)\t(?<qtde>[^\t]+)\t(?<endereco>[^\t]+)\t(?<fornecedor>[^\t]+)$/)		
			if r
				compra = Compra.new
				compra.comprador = r['comprador']
				compra.descricao = r['desc']
				compra.preco     = r['preco'].to_f
				compra.quantidade= r['qtde'].to_i
				compra.endereco  = r['endereco']
				compra.fornecedor= r['fornecedor']
				compra.save			
			end
			
		end		
		logger.info "Arquivo '#{arquivo.original_filename}' carregado com Sucesso"		
		respond_to do |format|
			format.html { redirect_to compras_url, notice: "Arquivo '#{arquivo.original_filename}' importado com Sucesso.\n#{contador} registro(s) inserido(s)." }
		end
	end
	#redirect_to root_url	
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_compra
      @compra = Compra.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def compra_params
      params.require(:compra).permit(:comprador, :descricao, :preco, :quantidade, :endereco, :fornecedor)
    end
end
