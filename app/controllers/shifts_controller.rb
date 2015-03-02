class ShiftsController < ApplicationController

  before_action :find_shift, only: [:show, :edit, :update, :destroy]

  def index
    # @shifts = Shift.where(job: current_user.job)
    @shifts = Shift.by_job(current_user).recent
  end

  def new
    @shift  = current_user.shifts.build
  end

  def create
    @shift  = current_user.shifts.build(shift_params)
    if @shift.save!
      redirect_to @shift
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @shift.update!(shift_params)
      redirect_to @shift
    else
      render :edit
    end
  end

  def destroy
    @shift.destroy
    redirect_to root_path
  end

  private

  def shift_params
    params.require(:shift).permit(:date, :time, :description)
  end

  def find_shift
    @shift  = Shift.find(params[:id])
  end
end
