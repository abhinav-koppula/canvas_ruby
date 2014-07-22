class ThreeDimensionButton
  def initialize(x1, y1, width, height, text, color)
    @button = Button.new(x1, y1, width, height, text, color)
    @lines = [
        Line.new(x1 + 10, y1 + 10, x1 + width - 10, y1 + 10, Color.black),
        Line.new(x1+width - 10, y1+10, x1+width-10, y1 + height -10, Color.black),
        Line.new(x1+width -10, y1+height-10, x1 + 10, y1+height-10, Color.white),
        Line.new(x1 + 10, y1+height - 10, x1 + 10, y1 + 10, Color.white)
    ]
  end

  def receive_click(javaEvent)
    @button.receive_click(javaEvent)
  end

  def render(graphics)
    @button.render(graphics)
    @lines.each { |line| line.render(graphics) }
  end

  def visual_effect(javaEvent)
    if receive_click(javaEvent)
      temp = @lines[0].color
      @lines[0].color = @lines[1].color = @lines[2].color
      @lines[2].color = @lines[3].color = temp
    end
  end
end