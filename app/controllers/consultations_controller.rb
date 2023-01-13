class ConsultationsController < ApplicationController

  def index
    @consultations = Consultation.all
    @consultation = Consultation.new
  end

  def show
    @consultation = Consultation.find(params[:id])
  end

  def new
        @consultation = Consultation.new
        @timePass = params[:start_time]
        @consultation.start_time = @timePass
        @datePass = params[:start_date]
        @consultation.start_date = @datePass
        @currentTime = Time.zone.now
  end

  def edit
    @consultation = Consultation.find(params[:id])
    if editUserConsultation 
        render :edit
    else 
        flash[:danger] = "Impossivel editar essa reunião!"
        redirect_to consultations_path
    end
  end

  def editUserConsultation
    @consultation.user_id == session[:user_id] && Time.zone.now < @consultation.start_date
  end 

  def create
    @consultation = Consultation.new(consultation_params)
    @consultation.user_id = session[:user_id]

    respond_to do |format|
      if @consultation.save!
        format.html { redirect_to consultations_path }
        format.json { render :home, status: :created, location: @consultation } 
        flash[:notice] = "Reunião foi criada com sucesso!" 
      else
        format.html { redirect_to consultations_path }
        format.json { render json: @consultation.errors, status: :unprocessable_entity }
        flash[:notice] = "Erro na criação da reunião!" 
      end
    end
  end

  def update
    respond_to do |format|
      @consultation = Consultation.find(params[:id])
      if @consultation.update(consultation_params)

        format.html { redirect_to consultations_path, notice: "Reunião foi atualizada com sucesso!" }
        format.json { render :home, status: :ok, location: @consultation }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @consultation.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @consultation = Consultation.find(params[:id])
    @consultation.destroy

    respond_to do |format|
      format.html { redirect_to consultations_path, notice: "Reunião foi removida  com sucesso!" }
      format.json { head :no_content }
    end
  end

   private

    def consultation_params
      params.require(:consultation).permit(:user, :title, :description, :start_time, :start_date)
    end
end
