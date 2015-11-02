class ShiftsController < ApplicationController

  before_action :find_shift, only: [:show, :edit, :update, :destroy]
  before_action :signed_in_user, except: :index
  before_action :correct_user, only: [:edit, :update, :destroy]


  def index
    @shifts = current_user ? Shift.by_job(current_user).recent : Shift.recent
  end

  def new
    @shift  = current_user.shifts.build
  end

  def create
    @shift  = current_user.shifts.build(shift_params)
    @shift.job = current_user.job
    if @shift.save!
      redirect_to @shift, flash: {success: 'Shift has been created !'}
    else
      flash[:danger] = 'Shift has not been created !'
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @shift.update(shift_params)
      redirect_to @shift, flash: {success: 'shift has been updated !'}
    else
      flash[:danger] = 'Shift has not been updated !'
      render :edit
    end
  end

  def destroy
    @shift.destroy
    redirect_to root_path, flash: {warning: 'Shift has been destroyed !'}
  end

  private

  def shift_params
    params.require(:shift).permit(:date, :time, :description, :job, :user_id)
  end

  def find_shift
    @shift  = Shift.find(params[:id])
  end

  def correct_user
    if current_user && ((@shift.user_id != current_user.id) && !current_user.is_admin)
      flash[:danger] = 'You are not a correct user !'
      redirect_to root_path
    end
  end
end
