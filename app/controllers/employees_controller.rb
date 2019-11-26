class EmployeesController < ApplicationController
  def index
    render json: Employee.all
  end

  def show
    render json: employee
  end

  def create
    render json: Employee.create!(employee_params)
  end

  def update
    employee.update!(employee_params)
    render json: employee
  end

  def destroy
    employee.destroy!
    render :ok
  end

  private

  def employee
    @employee ||= Employee.find(params.require(:id))
  end

  def employee_params
    params.permit(:name, :department_id)
  end
end
