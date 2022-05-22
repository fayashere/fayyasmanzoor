# frozen_string_literal: true

module PeopleInfoParsingService
  class ParsePeopleInfo
    def self.parse(info, delimiter)
      new(info, delimiter).parse
    end

    private

    def parse
      result = []
      lines = extract_lines
      column_names = lines[0].split(@delimiter).map(&:strip)
      rows = split_each_line(lines.drop(1))

      rows.each do |row|
        result << row_to_hash(row, column_names)
      end
      result
    end

    def row_to_hash(row, column_names)
      h = {}
      row.each_with_index do |val, index|
        h[column_names[index]] = val
      end
      h.with_indifferent_access
    end

    def extract_lines
      @info.split("\n")
    end

    def split_each_line(lines)
      rows = []
      lines.drop(1).each do |line|
        row = line.split(@delimiter).map(&:strip)
        rows << row
      end
      rows
    end

    def initialize(info, delimiter)
      @info = info
      @delimiter = delimiter
    end
  end
end
