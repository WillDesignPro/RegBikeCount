class StepCounterService
  def initialize(pressure)

  end

  def regbikecount
    step_counter = StepCounter.new

    resultado = params[:teste].match(/(\d{10})(\d{2}.\d)(\d)(\d)/)
    resu = Time.at(resultado[1].to_i)
    step_counter.date = Time.new
    step_counter.speed = resultado[2]
    step_counter.kind = resultado[3]

    step_counter.pressure = calculo_peso(resultado[4])
    step_counter.save

    redirect_to "/step_counters"
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
end
