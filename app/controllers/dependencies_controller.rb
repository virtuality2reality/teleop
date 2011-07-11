# encoding: UTF-8
class DependenciesController < ApplicationController
  
  def edit
    @survey = Survey.find(params[:id])
    add_base_breadcrumb
    
    @survey_options = @survey.select_options
  end
  
  def update
    @survey = Survey.find(params[:id])
    add_base_breadcrumb
    
    respond_to do |format|
      if @survey.update_attributes(params[:survey])
        format.html { redirect_to(client_survey_path(@survey.client, @survey), :notice => 'Dépendances mises à jour avec succès.') }
      else
        @survey_options = @survey.select_options
        format.html { render :action => "edit" }
      end
    end
  end
  
  private
  def add_base_breadcrumb
    add_breadcrumb @survey.client.representation, client_path(@survey.client)
    add_breadcrumb @survey.representation, client_survey_path(@survey.client, @survey)
    add_breadcrumb "Gestion des dépendances", nil
  end
  
end