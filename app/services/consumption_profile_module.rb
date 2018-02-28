module ConsumptionProfileModule
  def default_consumption_profile
    [
      3.9,
      3.1,
      2.0,
      1.2,
      1.1,
      1.0,
      0.9,
      1.1,
      1.2,
      1.4,
      1.9,
      2.1,
      2.5,
      2.5,
      2.7,
      3.5,
      3.5,
      3.8,
      4.4,
      3.9,
      3.6,
      3.5,
      3.5,
      2.4
    ].map {|num| num / 60.7}
  end
end
