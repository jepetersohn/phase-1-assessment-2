require_relative 'modules'

class IncidentReport
  attr_reader :description, :reporter
  attr_accessor :assigned_employee
  include Reportable

  def initialize(args = {})
    @description = args.fetch(:description) { "Unknown damage" }
    @reporter = args.fetch(:reporter) { "anonymous" }
    @resolved = false
  end

end

  # def resolved?
  #   !!@resolved
  # end

  # def close
  #   @resolved = true
  # end

  # def assigned?
  #   !!@assigned_employee
  # end