require 'spec_helper'

describe Button do

  it 'should create a button' do
    button = Button.new(10, 20, 250, 350, "click me", Color.red)

    graphics = double("graphics")
    expect(graphics).to receive(:setColor).with(Color.red).exactly(4).times
    expect(graphics).to receive(:drawLine).with(10,20,260,20)
    expect(graphics).to receive(:drawLine).with(260,20,260,370)
    expect(graphics).to receive(:drawLine).with(260, 370,10,370)
    expect(graphics).to receive(:drawLine).with(10,370,10,20)
    expect(graphics).to receive(:drawString).with("click me", 93, 195)
    button.render(graphics)
  end

  it "should check if button is clicked" do
    button = Button.new(10, 20, 250, 350, "click me", Color.red)
    frame = double("Frame")
    expect(frame).to receive(:setDefaultCloseOperation).with(javax.swing.JFrame::EXIT_ON_CLOSE)
    expect(frame).to receive(:setSize).with(800,600)
    expect(frame).to receive(:setVisible).with(true)
    expect(frame).to receive(:add).with(any_args)
    expect(frame).to receive(:addMouseListener).with(any_args)
    expect(frame).to receive(:validate)
    expect(frame).to receive(:repaint)
    expect(javax.swing.JFrame).to receive(:new).and_return(frame)
    Canvas.new.add(button)
    javaEvent = double("javaEvent")

    expect(frame).to receive(:mouseClicked).and_return([125,250])
    expect(button.check_click(frame.mouseClicked(javaEvent))).to eq(true)
  end
end