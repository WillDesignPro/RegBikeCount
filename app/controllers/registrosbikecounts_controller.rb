class RegistrosbikecountsController < ApplicationController
  before_action :set_registrosbikecount, only: [:show, :edit, :update, :destroy]

  # GET /registrosbikecounts
  # GET /registrosbikecounts.json
  def index
    @registrosbikecounts = Registrosbikecount.all
  end

  # GET /registrosbikecounts/1
  # GET /registrosbikecounts/1.json
  def show  
  end

  # GET /registrosbikecounts/new
  def new
    @registrosbikecount = Registrosbikecount.new
  end

  # GET /registrosbikecounts/1/edit
  def edit
  end

  # POST /registrosbikecounts
  # POST /registrosbikecounts.json
  def create
    @registrosbikecount = Registrosbikecount.new(registrosbikecount_params)

    respond_to do |format|
      if @registrosbikecount.save
        format.html { redirect_to @registrosbikecount, notice: 'Registrosbikecount was successfully created.' }
      # format.json { render :show, status: :created, location: @registrosbikecount }
      else
        format.html { render :new }
      # format.json { render json: @registrosbikecount.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /registrosbikecounts/1
  # PATCH/PUT /registrosbikecounts/1.json
  def update
    respond_to do |format|
      if @registrosbikecount.update(registrosbikecount_params)
        format.html { redirect_to @registrosbikecount, notice: 'Registrosbikecount was successfully updated.' }
      # format.json { render :show, status: :ok, location: @registrosbikecount }

      else
        format.html { render :edit }
      # format.json { render json: @registrosbikecount.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /registrosbikecounts/1
  # DELETE /registrosbikecounts/1.json
  def destroy
    @registrosbikecount.destroy
    respond_to do |format|
      format.html { redirect_to registrosbikecounts_url, notice: 'Registrosbikecount was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def regbikecount
   registrosbikecount = Registrosbikecount.new

    resultado = params[:teste].match(/(\d{10})(\d{2}.\d)(\d)(\d)/) 
      resu = Time.at(resultado[1].to_i)
      registrosbikecount.dia = resu.strftime("%d/%m/%Y")
      registrosbikecount.hora = resu.strftime("%H:%M:%S")
      registrosbikecount.velocidade = resultado[2]
      registrosbikecount.tipo = resultado[3]
      #registrosbikecount.pressao = resultado[4]
      registrosbikecount.pressao = calculo_peso(resultado[4])
      registrosbikecount.save
      redirect_to "/registrosbikecounts"
  end

  def calculo_peso resultado

    pressao_kpa = resultado
    pressao_pascal = 0
    pressao_newtons = 0.0
    peso_kg = 0.0
    const = 9.806

    pressao_pascal = pressao_kpa * 0.001
    pressao_newtons = pressao_pascal * 2.4
    peso_kg = pressao_newtons.to_s + const.to_s

  end

  def retornodata
    tempo = Time.now
    tempo = tempo.to_i
    render :text => tempo.to_s
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_registrosbikecount
      @registrosbikecount = Registrosbikecount.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def registrosbikecount_params
      params.require(:registrosbikecount).permit()
    end
end

