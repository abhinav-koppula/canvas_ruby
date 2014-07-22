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
    @rectangle = Rectangle.new(@x1, @y1, @width, @height, @color)
    @outer_rectangle = Rectangle.new(@x1 - 5, @y1 - 5, @width , @height , Color.white)
  end

  def render(graphics)
    @rectangle.render(graphics)
    graphics.drawString @text, @x1+(@width/3), @y1 + (@height/2)
  end

  def receive_click(javaEvent)
    if (javaEvent.getX >= @x1 && javaEvent.getX <= (@x1 + @width)) && (javaEvent.getY >= @y1 && javaEvent.getY <= (@y1 + @height))
      Kernel.puts "Clicked on #{@text}"
      true
    else
      false
    end
  end
end