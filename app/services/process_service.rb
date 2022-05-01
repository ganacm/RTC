require_relative 'helpers/application_helper.rb'
  class ProcessService
    extend ApplicationHelper

  DELIMITER = { DOLLAR: "$", PERCENT: "%" }
  attr_accessor :delimiter, :data


  def initialize
    @@all_rows_hash ||= []
    add_to_parent
  end

  def self.getSortedValues ordr
    sorted_row_hash = sort_row(ordr)
    result = sorted_row_hash.map do  |r|
      values = []
      values << r["first_name"]
      values << get_full_form(r["city"])
      values << format_date(r["birthdate"])
      values.join(', ')
    end
    result
  end

  private

  def rows_array
    @rows_array ||= @data.split("\n")
    # dataset.split("\n")
  end

  def header
    @header ||= rows_array[0]
  end
  def header_columns
    @header_columns ||= ssplit(header)
  end

  def data_rows_array
    @data_rows_array ||= rows_array[1..(rows_array.size-1)]
  end

  def rows_hash
    @rows_hash ||= (
      @rows_hash=[]
      data_rows_array.each do |dr|
        elements = ssplit(dr)
        @rows_hash << header_columns.inject({}) do |key, value|
          key[value] = elements[header_columns.index(value)]
          key
        end
      end
      @rows_hash
    )
  end

  def self.sort_row order
    @@all_rows_hash.sort_by! {|r| r[order]}
  end

  def ssplit str
    str.split(delimiter).map(&:strip)
  end

    def add_to_parent
      @@all_rows_hash += rows_hash
    end

  end
