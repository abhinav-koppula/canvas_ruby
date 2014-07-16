require 'rspec'

describe 'Rectangle' do

  it 'should be rendered' do
    tx = 10
    ty = 20
    width = 250
    height = 350
    color = Color.red
    rectangle = Rectangle.new(tx, ty, width, height, color)
    canvas = Canvas.new
    frame = double("frame")
    expect(frame).to receive(:javax.swing.JFrame.new).with("Canvas")
    expect(frame).to receive(:setDefaultCloseOperation).with(javax.swing.JFrame::EXIT_ON_CLOSE)
    expect(frame).to receive(:setSize).with(800,600)
    expect(frame).to receive(:setVisible).with(true)
    expect(frame).to receive(:add).with(self)
    expect(frame).to receive(:validate)
    expect(frame).to receive(:repaint)
    canvas.initialize_frame frame
    canvas.add rectangle
    expect(graphics).to receive(:fillRect).with(1,3,2,4)
    expect(graphics).to receive(:setColor).with(Color.red)
    canvas.paint(graphics)
  end
end