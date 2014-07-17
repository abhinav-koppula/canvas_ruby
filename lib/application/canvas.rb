puts "#{RUBY_PLATFORM}"
class Canvas < javax.swing.JPanel
  attr_reader :canvas_objects
  def initialize
    super
    @canvas_objects = []
    @frame = javax.swing.JFrame.new("Canvas")
    @frame.setDefaultCloseOperation(javax.swing.JFrame::EXIT_ON_CLOSE)
    @frame.setSize(800, 600)
    @frame.setVisible(true)
    @frame.add(self)
    @frame.validate
    @frame.repaint
  end


  def paintComponent(graphics)
    super(graphics)
    paint graphics
  end

  def add canvas_object
    @canvas_objects << canvas_object
  end
  def render
    @frame.repaint
  end
  def paint graphics
    @canvas_objects.each{
      |canvas_object| canvas_object.render(graphics)
    }
  end
end


