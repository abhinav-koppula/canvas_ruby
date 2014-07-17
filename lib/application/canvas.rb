puts "#{RUBY_PLATFORM}"
class Canvas < javax.swing.JPanel
  include java.awt.event.MouseListener
  attr_reader :canvas_objects

  def initialize
    super
    @canvas_objects = []
    @frame = javax.swing.JFrame.new("Canvas")
    @frame.setDefaultCloseOperation(javax.swing.JFrame::EXIT_ON_CLOSE)
    @frame.setSize(800, 600)
    @frame.setVisible(true)
    @frame.addMouseListener(self)
    @frame.add(self)
    @frame.validate
    @frame.repaint
  end


  def paintComponent(graphics)
    super(graphics)
    paint graphics
  end

  def mouseEntered(javaEvent);end
  def mouseExited(javaEvent);end
  def mousePressed(javaEvent);end
  def mouseReleased(javaEvent);end

  def mouseClicked(javaEvent)
    @canvas_objects.each {
        |canvas_object|
        if canvas_object.check_click([javaEvent.getX, javaEvent.getY - 20])
          puts "Clicked on #{canvas_object.text}"
        end
    }
    puts "click on #{javaEvent.getX} #{javaEvent.getY - 20}"
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


