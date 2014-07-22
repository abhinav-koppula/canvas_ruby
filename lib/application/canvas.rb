puts "#{RUBY_PLATFORM}"
class Canvas < javax.swing.JPanel
  include java.awt.event.MouseListener
  attr_reader :building_blocks

  def initialize
    super
    @building_blocks = []
    @frame = javax.swing.JFrame.new("Canvas")
    @frame.setDefaultCloseOperation(javax.swing.JFrame::EXIT_ON_CLOSE)
    @frame.setSize(800, 600)
    @frame.setVisible(true)
    @frame.addMouseListener(self)
    @frame.add(self)
    @frame.validate
    @frame.repaint

    @observers = []
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
    @building_blocks.each {
        |building_block|
        building_block.receive_click(javaEvent)
    }
  end

  def mousePressed(javaEvent)
    @observers.each{|observer| observer.visual_effect(javaEvent)}
    self.render
  end

  def mouseReleased(javaEvent)
    @observers.each{|observer| observer.visual_effect(javaEvent)}
    self.render
  end

  def add building_block
    @building_blocks << building_block
  end

  def register_observer(building_block)
    @observers.push(building_block)
  end

  def render
    @frame.repaint
  end

  def paint graphics
    @building_blocks.each{
      |building_block| building_block.render(graphics)
    }
  end
end


