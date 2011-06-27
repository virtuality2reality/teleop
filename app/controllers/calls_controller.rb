# encoding: UTF-8
class CallsController < ApplicationController
  authorize_resource
  
  # GET /calls
  # GET /calls.xml
  def index
    @calls = Call.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /calls/1
  # GET /calls/1.xml
  def show
    @call = Call.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /calls/new
  # GET /calls/new.xml
  def new
    @call = Call.new(:survey_id => params[:survey_id])
    @call.survey.sections.each do |s|
      s.questions.each do |q|
        a = @call.answers.build
        a.question = q
      end
    end

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /calls/1/edit
  def edit
    @call = Call.find(params[:id])
  end

  # POST /calls
  # POST /calls.xml
  def create
    @call = Call.new(params[:call])
    
    respond_to do |format|
      if @call.save
        format.html { redirect_to(new_client_survey_call_path(@call.survey.client, @call.survey), :notice => "L'appel a été enregistré. Vous pouvez effectuer un nouvel appel.") }
      else
        format.html { render :action => "new" }
      end
    end
  end

  # PUT /calls/1
  # PUT /calls/1.xml
  def update
    @call = Call.find(params[:id])

    respond_to do |format|
      if @call.update_attributes(params[:call])
        format.html { redirect_to([@call.survey.client, @call.survey], :notice => "L'appel a été mis à jour.") }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  # DELETE /calls/1
  # DELETE /calls/1.xml
  def destroy
    @call = Call.find(params[:id])
    @call.destroy

    respond_to do |format|
      format.html { redirect_to(calls_url) }
    end
  end
end
