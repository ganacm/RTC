
  class ProcessPercentService < ProcessService
  def initialize data
    @data = data
    @delimiter = DELIMITER[:PERCENT]
    super()
  end

end