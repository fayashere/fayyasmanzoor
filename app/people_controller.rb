# frozen_string_literal: true

class PeopleController
  def initialize(params)
    @params = params
  end

  def normalize
    parsed_info = []
    parsed_info += parse_dollar_format if @params[:dollar_format]
    parsed_info += parse_percent_format if @params[:percent_format]
    sort_parsed_info(parsed_info)

    parsed_info
  end

  private

  def parse_dollar_format
    PeopleInfoParsingService::ParsePeopleInfo.parse(@params.dollar_format, '$')
  end

  def parse_percent_format
    PeopleInfoParsingService::ParsePeopleInfo.parse(@params.percent_format, '%')
  end

  def sort_parsed_info(info)
    PeopleInfoSortingService::SortByColumn.sort(info, @params.order) if @params[:order]
  end

  attr_reader :params
end
