require 'spec_helper'

describe 'Rectangle' do

  it 'should be rendered' do
    tx = 10
    ty = 20
    width = 250
    height = 350
    rectangle = Rectangle.new(tx, ty, width, height, Color.red)
    rectangle = Rectangle.new(10,10,100,100,Color.red)
    graphics = double("graphics")
    expect(graphics).to receive(:setColor).with(Color.red).exactly(4).times
    expect(graphics).to receive(:drawLine).with(10,10,110,10)
    expect(graphics).to receive(:drawLine).with(110,10,110,110)
    expect(graphics).to receive(:drawLine).with(110,110,10,110)
    expect(graphics).to receive(:drawLine).with(10,110,10,10)
    rectangle.render(graphics)


  end
end