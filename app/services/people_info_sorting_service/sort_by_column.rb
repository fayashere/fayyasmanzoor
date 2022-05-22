# frozen_string_literal: true

module PeopleInfoSortingService
  class SortByColumn
    def self.sort(data, column_name)
      new(data, column_name).sort
    end

    private

    def sort
      @data.sort_by! { |h| h[@column_name] }
    end

    def initialize(data, column_name)
      @data = data
      @column_name = column_name
    end
  end
end

