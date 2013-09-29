class WidgetSerializer
  include MultidispatchDSL

  def self.process(record)
    new.process(record)
  end

  mdef(:process, String) do |value|
    { :string => value }
  end

  mdef(:process, Fixnum) do |value|
    { :int => value }
  end

  mdef(:process, :anything) do |value|
    { :anything => value }
  end
end
