#It draws rectangle for given coordinates
class Rectangle
  def initialize(top_x, top_y, width, height, color)
    @top_x = top_x
    @top_y = top_y
    @width = width
    @height = height
    @color = color
    @sides = [
        Line.new(top_x, top_y, top_x+width, top_y, color),
        Line.new(top_x+width, top_y, top_x+width, top_y+height, color),
        Line.new(top_x+width, top_y+height, top_x, top_y+height, color),
        Line.new(top_x, top_y+height, top_x, top_y, color)
    ]
  end

  def render graphics
    @sides.each{
      |side| side.render(graphics)
    }
  end
end