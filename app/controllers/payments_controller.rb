class PaymentsController < ApplicationController
  def index
    @group = Group.find(params[:group_id])
    @payments = @group.payments.order(created_at: :desc)
  end

  def new
    @group = Group.find(params[:group_id])
    @payment = @group.payments.build
  end

  def create
    @group = Group.find(params[:group_id])
    @payment = @group.payments.new(payment_params)
    @payment.author_id = current_user.id
    if @payment.save
      redirect_to group_payments_path(@group), notice: 'Payment created successfully'
    else
      render :new, format: :html
    end
  end

  private

  def payment_params
    params.require(:payment).permit(:name, :amount, group_ids: [])
  end
end
