class KudosController < ApplicationController
  before_action :set_kudo, only: %i[show edit update destroy]
  before_action :authenticate_employee!
  before_action :correct_employee, only: %i[edit update destroy]

  #included part of the code from  the next tasks
  # GET /kudo
  def index
    @kudos = Kudo.all
  end

  # GET /kudos/1
  def show; end

  # GET /kudos/new
  def new
    if current_employee.number_of_available_kudos.zero?
      redirect_to kudos_path, notice: 'Not enough available kudos to create new one!'
    else
      @kudo = Kudo.new
    end
  end

  # GET /kudos/1/edit
  def edit; end

  # POST /kudos
  def create
    if current_employee.number_of_available_kudos.zero?
      redirect_to kudos_path, notice: 'Not enough available kudos to create new one!'
    else
      @kudo = Kudo.new(kudo_params)
      @kudo.giver = current_employee

      if @kudo.save
        current_employee.update_attribute(:number_of_available_kudos,
                                          (current_employee.number_of_available_kudos - 1))
        redirect_to kudos_path, notice: 'Kudo was successfully created.'
      else
        render :new
      end
    end
  end

  def correct_employee
    redirect_to kudos_path, notice: 'Not authorized to access this Kudo.' unless @kudo.giver == current_employee
  end

  # PATCH/PUT /kudos/1
  def update
    if @kudo.update(kudo_params)
      redirect_to kudos_path, notice: 'Kudo was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /kudos/1
  def destroy
    @kudo.destroy
    current_employee.update_attribute(:number_of_available_kudos, (current_employee.number_of_available_kudos + 1))
    redirect_to kudos_url, notice: 'Kudo was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_kudo
    @kudo = Kudo.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def kudo_params
    params.require(:kudo).permit(:title, :content, :giver_id, :receiver_id)
  end
end
