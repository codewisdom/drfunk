class ScenariosController < ApplicationController

  def index
    @plan = Plan.find(params[:plan_id])
  end

  def show
    @scenario = Scenario.find(params[:id])
  end

  def create
    @scenario = Scenario.new(params[:scenario])
    @plan = Plan.find(params[:plan_id])

    @scenario.plan_id = @plan.id 
    @scenario.save
  end

  def edit
    @scenario = Scenario.find(params[:id])
  end

  def update
    @scenario = Scenario.find(params[:id])
    @scenario.update_attribute(:name, params[:scenario][:name])
  end

  def update_feature
    @scenario = Scenario.find(params[:scenario_id])
    @scenario.update_attribute(:feature_id, params[:feature_id])
    @plan = Plan.find(params[:plan_id])
  end

  def update_step_order
    order = params[:sort_step_list]
    order.each_with_index do |id, position|
      Step.find(id).update_attribute(:position, position + 1)
    end

    @scenario = Scenario.find(params[:id])
  end

  def destroy
    @scenario = Scenario.find(params[:id])
    plan = @scenario.plan
    @scenario.destroy

    redirect_to(plan_scenarios_url(plan))
  end

end
