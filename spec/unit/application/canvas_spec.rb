require 'spec_helper'

describe 'Canvas' do

  it 'should store the line to canvas' do
    line = Line.new(1,2,3,4,Color.black)
    canvas = Canvas.new
    canvas.add(line)
    expect(canvas.lines).to eq([line])
  end

  it "foo" do
    frame = double("Frame")
    expect(frame).to receive(:setDefaultCloseOperation).with(javax.swing.JFrame::EXIT_ON_CLOSE)
    expect(frame).to receive(:setSize).with(800,600)
    expect(frame).to receive(:setVisible).with(true)
    expect(frame).to receive(:add).with(any_args)
    expect(frame).to receive(:validate)
    expect(frame).to receive(:repaint)

    allow(javax.swing.JFrame).to receive(:new).and_return(frame)

    Canvas.new
  end
end