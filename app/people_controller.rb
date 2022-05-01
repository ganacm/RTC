require_relative 'services/process_service.rb'
require_relative 'services/process_dollar_service.rb'
require_relative 'services/process_percent_service.rb'
class PeopleController
  def initialize(params)
    @params = params
  end

  def normalize
    if params[:dollar_format]
      parser = ProcessDollarService.new(params[:dollar_format])
    end
    if params[:percent_format]
      parser = ProcessPercentService.new(params[:percent_format])
    end
    parser.class.getSortedValues("first_name")
  end

  private

  attr_reader :params
end
