class Notifier
  def initialize
    @observers = []
    @observables = []
  end

  def register_observer(observer)
    @observers.push(observer)
  end

  def register_observable(observable)
    @observables.push(observable)
  end

  def mouse_pressed_event(javaEvent)
    @observers.each{|observer| observer.visual_effect(javaEvent)}
    @observables[0].render
  end
end