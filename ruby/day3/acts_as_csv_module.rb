module ActsAsCsv
  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    def acts_as_csv
      include InstanceMethods
    end
  end

  module InstanceMethods
    def read
      @csv_contents = []
      filename = self.class.to_s.downcase + '.txt'
      file = File.new(filename)
      @headers = file.gets.chomp.split(', ')

      file.each do |row|
        @csv_contents << row.chomp.split(', ')
      end
    end

    attr_accessor :headers, :csv_contents

    def initialize
      read
    end
  end
end


class RubyCsv
  include ActsAsCsv
  acts_as_csv

  def each(&block)
    (0...self.headers.length).to_a.each do |i|
      self.csv_contents.each do |row|
        block.call CsvRow.new(self.headers[i], row[i])
      end
    end
  end



end

class CsvRow
  def initialize (key, values)
    @content = {key => values}
  end

  def content
    @content
  end

  def method_missing(name, *args)
    if @content.has_key?(name.to_s)
      @content.values_at(name.to_s)
    end
  end
end

#m = RubyCsv.new
#puts m.headers.inspect
#puts m.csv_contents.inspect

csv = RubyCsv.new
csv.each {|row| puts row.one}
