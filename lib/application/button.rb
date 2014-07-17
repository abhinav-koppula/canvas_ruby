#Creates a Button and catches its click
class Button
  attr_reader :text
  def initialize(x1, y1, width, height, text, color)
    @x1 = x1
    @y1 = y1
    @width = width
    @height = height
    @text = text
    @color = color
  end

  def render(graphics)
    Rectangle.new(@x1, @y1, @width, @height, @color).render(graphics)
    graphics.drawString @text, @x1+(@width/3), @y1 + (@height/2)
  end

  def check_click(javaEvent)
    (javaEvent[0] >= @x1 && javaEvent[0] <= (@x1 + @width)) && (javaEvent[1] >= @y1 && javaEvent[1] <= (@y1 + @height))
  end
end