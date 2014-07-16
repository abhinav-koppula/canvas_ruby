require 'spec_helper'

describe Line do

  it 'should draw a line on canvas' do
    graphics = double("graphics")
    line = Line.new(1,2,3,4,Color.black)
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
    canvas.add line
    expect(graphics).to receive(:drawLine).with(1,3,2,4)
    expect(graphics).to receive(:setColor).with(Color.black)
    canvas.paint(graphics)
  end
end