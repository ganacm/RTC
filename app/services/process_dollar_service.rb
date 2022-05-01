class ProcessDollarService < ProcessService
  def initialize data
    @data = data
    @delimiter = DELIMITER[:DOLLAR]
    super()
  end
end

