class DepartmentsController < ApplicationController
  def index
    render json: DepartmentsFilterer.new(params).call
  end

  def show
    render json: department
  end

  def create
    render json: Department.create!(department_params)
  end

  def update
    department.update!(department_params)
    render json: department
  end

  def destroy
    department.destroy!
    render :ok
  end

  private

  def department
    @department ||= Department.find(params.require(:id))
  end

  def department_params
    params.permit(:name)
  end
end
