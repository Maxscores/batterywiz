class Consumption < ApplicationRecord
  include ConsumptionEstimationModule

  belongs_to :installation
  has_one :solar_system, through: :installation

  validates_presence_of :jan, :feb, :mar, :apr, :may, :jun, :jul, :aug, :sep, :oct, :nov, :dec

  def estimated_hourly_consumption
    estimate_consumption(avg_daily_consumption)
  end

  def daily_consumption
    (1..12).map do |month|
      (1..Time.days_in_month(month)).map do
        avg_daily_consumption[month-1]
      end
    end.flatten
  end

  def avg_daily_consumption
    [
      jan.to_f,
      feb.to_f,
      mar.to_f,
      apr.to_f,
      may.to_f,
      jun.to_f,
      jul.to_f,
      aug.to_f,
      sep.to_f,
      oct.to_f,
      nov.to_f,
      dec.to_f
    ].map.with_index {|num, index| num / Time.days_in_month(index+1)}
  end

  def monthly_consumption
    {
      1 => jan.to_f,
      2 => feb.to_f,
      3 => mar.to_f,
      4 => apr.to_f,
      5 => may.to_f,
      6 => jun.to_f,
      7 => jul.to_f,
      8 => aug.to_f,
      9 => sep.to_f,
      10 => oct.to_f,
      11 => nov.to_f,
      12 => dec.to_f
    }
  end
end
