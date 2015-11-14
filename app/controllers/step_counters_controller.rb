class StepCountersController < ApplicationController
  def index
    @step_counters = StepCounter.all

    respond_with(@step_counters)
  end

  def save
    @step_counter = StepCounterService.new(params[:pressure])
    @step_counter.save

    redirect_to step_counters_path
  end
end
