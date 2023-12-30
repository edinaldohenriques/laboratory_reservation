class ReservationsController < ApplicationController
  before_action :set_reservation, only: %i[edit update show destroy]

  def index
    @reservations = policy_scope(Reservation.order(:reservation_date))
  end

  def show; end

  def new
    @reservation = Reservation.new
    authorize @reservation
  end

  def create 
    @reservation = Reservation.new(reservation_params)
    authorize @reservation
    
    if @reservation.save
      flash[:success] = 'Reserva cadastrada com sucesso!'
      redirect_to reservations_path
    else 
      render 'new'
    end
  end

  def edit; end

  def update
    if @reservation.update(reservation_params)
      flash[:success] = 'Reserva atualizada com sucesso!'
      redirect_to reservations_path
    else
      render 'edit'
    end
  end

  def destroy
    @reservation.destroy
    flash[:success] = 'Reserva excluída com sucesso!'
    redirect_to reservations_path
  end

  private 
    def reservation_params
      params.require(:reservation).permit(:reservation_date, :reservation_type, :user_id)
    end

    def set_reservation
      @reservation = policy_scope(Reservation).find(params[:id])
      authorize @reservation
    end
end
