class Table
  attr_reader :cols
  attr_reader :rows

  def initialize(cols = 5, rows = 5)
    raise 'Column count must be greater than zero' if cols <= 0
    raise 'Row count must be greater than zero' if rows <= 0

    @cols = cols
    @rows = rows
  end

  def point_in_rect?(x, y)
    x >= 0 && x < cols && y >= 0 && y < rows
  end
end
