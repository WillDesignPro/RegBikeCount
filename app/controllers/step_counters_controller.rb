class StepCountersController < ApplicationController
  def index
    @step_counters = StepCounter.all
  end

  def save
    @step_counter = StepCounterService.new(params[:pressure])

    respond_to do |format|
      if @step_counter.save
        format.html { redirect_to @step_counter, notice: 'step_counter was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end
end
