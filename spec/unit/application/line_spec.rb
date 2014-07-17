require 'spec_helper'

describe Line do

  it 'should draw a line on canvas' do

    line = Line.new(10,10,100,100,Color.red)
    frame = double("Frame")
    expect(frame).to receive(:setDefaultCloseOperation).with(javax.swing.JFrame::EXIT_ON_CLOSE)
    expect(frame).to receive(:setSize).with(800,600)
    expect(frame).to receive(:setVisible).with(true)
    expect(frame).to receive(:add).with(any_args)
    expect(frame).to receive(:addMouseListener).with(any_args)
    expect(frame).to receive(:validate)
    expect(frame).to receive(:repaint)

    expect(javax.swing.JFrame).to receive(:new).and_return(frame)

    Canvas.new.add(line)


  end
end