# encoding: UTF-8
class CallsController < ApplicationController
  authorize_resource
  
  # GET /calls
  # GET /calls.xml
  def index
    @calls = Call.all
    add_base_breadcrumb

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /calls/1
  # GET /calls/1.xml
  def show
    @call = Call.find(params[:id])
    add_base_breadcrumb

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /calls/new
  # GET /calls/new.xml
  def new
    @call = Call.new(:survey_id => params[:survey_id])
    add_base_breadcrumb
    add_breadcrumb "Nouvel appel", nil
    
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
    add_base_breadcrumb
    add_breadcrumb "Edition", nil
    build_missing_answers
  end

  # POST /calls
  # POST /calls.xml
  def create
    @call = Call.new(params[:call])
    add_base_breadcrumb
    add_breadcrumb "Nouvel appel", nil
    
    respond_to do |format|
      if @call.save
        format.html { redirect_to(new_client_survey_call_path(@call.survey.client, @call.survey), :notice => "L'appel a été enregistré. Vous pouvez effectuer un nouvel appel.") }
      else
        build_missing_answers
        format.html { render :action => "new" }
      end
    end
  end

  # PUT /calls/1
  # PUT /calls/1.xml
  def update
    @call = Call.find(params[:id])
    add_base_breadcrumb
    add_breadcrumb "Edition", nil

    respond_to do |format|
      if @call.update_attributes(params[:call])
        format.html { redirect_to([@call.survey.client, @call.survey], :notice => "L'appel a été mis à jour.") }
      else
        build_missing_answers
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
  
  private
  def build_missing_answers
    @call.survey.sections.each do |s|
      s.questions.each do |q|
        if @call.answer_for_question(q).nil?
          a = @call.answers.build
          a.question = q
        end
      end
    end
    @call.answers.sort! { |a,b| [a.question.section.position, a.question.position] <=> [b.question.section.position, b.question.position] }
  end
  
  def add_base_breadcrumb
    add_breadcrumb @call.survey.client.representation, client_path(@call.survey.client)
    add_breadcrumb @call.survey.representation, client_survey_path(@call.survey.client, @call.survey)
    add_breadcrumb @call.representation, client_survey_call_path(@call.survey.client, @call.survey, @call) if @call.persisted?
  end
end
