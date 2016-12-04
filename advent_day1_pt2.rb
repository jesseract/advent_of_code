# 1. Set starting coordinate and direction
# 2. Make array with instructions
# 3. Figure out how to take instructions, break them into rotation and distance
# 4. "Run instructions
# 5. Compare ending point with starting point
# 6. Determine manhattan distance
class Car
  def initialize
    @x = 0
    @y = 0
    @direction = :north
  end

  def turn_left
    if @direction == :north
      @direction = :west
    elsif @direction == :south
      @direction = :east
    elsif @direction == :west
      @direction = :south
    elsif @direction == :east
      @direction = :north
    end
  end

  def turn_right
    if @direction == :north
      @direction = :east
    elsif @direction == :south
      @direction = :west
    elsif @direction == :west
      @direction = :north
    elsif @direction == :east
      @direction = :south
    end
  end

  def move_car(distance)
    locations_visited = []
    for i in 0...distance
      if @direction == :east
        @x = @x + 1
      elsif @direction == :west
        @x = @x - 1
      elsif @direction == :north
        @y = @y + 1
      elsif @direction == :south
        @y = @y - 1
      end
      locations_visited << location
    end
    return locations_visited
  end

  def to_s
    array = [@x, @y, @direction]
    return array.to_s
  end

  def location
    return [@x, @y]
  end
end


def taxicab_problem
  instructions = ["R2", "L5", "L4", "L5", "R4", "R1", "L4", "R5", "R3", "R1", "L1", "L1", "R4", "L4", "L1", "R4", "L4", "R4", "L3", "R5", "R4", "R1", "R3", "L1", "L1", "R1", "L2", "R5", "L4", "L3", "R1", "L2", "L2", "R192", "L3", "R5", "R48", "R5", "L2", "R76", "R4", "R2", "R1", "L1", "L5", "L1", "R185", "L5", "L1", "R5", "L4", "R1", "R3", "L4", "L3", "R1", "L5", "R4", "L4", "R4", "R5", "L3", "L1", "L2", "L4", "L3", "L4", "R2", "R2", "L3", "L5", "R2", "R5", "L1", "R1", "L3", "L5", "L3", "R4", "L4", "R3", "L1", "R5", "L3", "R2", "R4", "R2", "L1", "R3", "L1", "L3", "L5", "R4", "R5", "R2", "R2", "L5", "L3", "L1", "L1", "L5", "L2", "L3", "R3", "R3", "L3", "L4", "L5", "R2", "L1", "R1", "R3", "R4", "L2", "R1", "L1", "R3", "R3", "L4", "L2", "R5", "R5", "L1", "R4", "L5", "L5", "R1", "L5", "R4", "R2", "L1", "L4", "R1", "L1", "L1", "L5", "R3", "R4", "L2", "R1", "R2", "R1", "R1", "R3", "L5", "R1", "R4"]

  car = Car.new
  past_locations = [car.location]

  for instruction in instructions
    puts car

    rotation = instruction.slice(0)
    if rotation == "L"
      car.turn_left
    else
      car.turn_right
    end
    distance = instruction.slice(1..-1).to_i
    locations_visited = car.move_car(distance)

    for current_location in locations_visited
      if past_locations.include?(current_location)
        puts current_location
        return
      end
    end
    past_locations.concat(locations_visited)
  end
end


if __FILE__ == $0
  taxicab_problem
end
