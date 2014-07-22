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

  # it "should check if button is clicked" do
  #   button = Button.new(10, 20, 250, 350, "click me", Color.red)
  #   canvas = double("Canvas")
  #   Canvas.new.add(button)
  #   javaEvent = double("java.awt.event.MouseEvent")
  #   allow(javaEvent).to receive(:getX).and_return(125)
  #   allow(javaEvent).to receive(:getY).and_return(550)
  #   allow(canvas).to receive(:mouseClicked).and_return(javaEvent)
  #   expect(Kernel).to receive(:puts).and_return("")
  #   button.receive_click(canvas.mouseClicked)
  # end

  it "should check if button is clicked" do
    button = Button.new(10, 20, 250, 350, "click me", Color.red)
    canvas = double("Canvas")
    Canvas.new.add(button)
    javaEvent = double("java.awt.event.MouseEvent")
    allow(javaEvent).to receive(:getX).and_return(125)
    allow(javaEvent).to receive(:getY).and_return(250)
    allow(canvas).to receive(:mouseClicked).and_return(javaEvent)
    expect(Kernel).to receive(:puts).and_return("Clicked on click me")
    button.receive_click(canvas.mouseClicked)
  end

end