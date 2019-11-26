# frozen_string_literal: true

class DepartmentsFilterer
  attr_reader :params

  def initialize(params = {})
    @params = params
  end

  def call
    base_query
      .then { |q| FilterByEmployeesCount.new(q, params).call }
  end

  private

  def base_query
    Department.all
  end

  class BaseFilter
    attr_reader :relation, :params

    def initialize(relation, params)
      @relation = relation
      @params = params
    end
  end

  class FilterByEmployeesCount < BaseFilter
    def call
      return relation unless employees_count

      relation
        .left_outer_joins(:employees)
        .group('departments.id')
        .having('count(employees) = ?', employees_count)
    end

    private

    def employees_count
      params[:employees_count].presence
    end
  end
end
