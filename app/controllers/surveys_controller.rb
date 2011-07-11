# encoding: UTF-8
class SurveysController < ApplicationController
  authorize_resource
  
  # GET /surveys/1
  # GET /surveys/1.xml
  def show
    @survey = Survey.find(params[:id])
    add_base_breadcrumb
    @calls = @survey.calls.paginate :page => params[:page], :per_page => 5

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @survey }
    end
  end

  # GET /surveys/new
  # GET /surveys/new.xml
  def new
    @survey = Survey.new
    @survey.client = Client.find(params[:client_id])
    add_base_breadcrumb
    add_breadcrumb "Nouveau questionnaire", nil

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /surveys/1/edit
  def edit
    @survey = Survey.find(params[:id])
    add_base_breadcrumb
    add_breadcrumb "Edition", nil
  end

  # POST /surveys
  # POST /surveys.xml
  def create
    @survey = Survey.new(params[:survey])
    add_base_breadcrumb
    add_breadcrumb "Nouveau questionnaire", nil

    respond_to do |format|
      if @survey.save
        format.html { redirect_to([@survey.client, @survey], :notice => 'Questionnaire créé avec succès.') }
      else
        format.html { render :action => "new" }
      end
    end
  end

  # PUT /surveys/1
  # PUT /surveys/1.xml
  def update
    @survey = Survey.find(params[:id])
    add_base_breadcrumb
    add_breadcrumb "Edition", nil

    respond_to do |format|
      if @survey.update_attributes(params[:survey])
        format.html { redirect_to(client_survey_path(@survey.client, @survey), :notice => 'Questionnaire mis à jour avec succès.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  # DELETE /surveys/1
  # DELETE /surveys/1.xml
  def destroy
    @survey = Survey.find(params[:id])
    @survey.destroy

    respond_to do |format|
      format.html { redirect_to(surveys_url) }
      format.xml  { head :ok }
    end
  end
  
  private
  def add_base_breadcrumb
    add_breadcrumb @survey.client.representation, client_path(@survey.client)
    add_breadcrumb @survey.representation, client_survey_path(@survey.client, @survey) if @survey.persisted?
  end
end
