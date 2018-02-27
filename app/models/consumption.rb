class Consumption < ApplicationRecord
  belongs_to :installation
  has_one :solar_system, through: :installation

  validates_presence_of :jan, :feb, :mar, :apr, :may, :jun, :jul, :aug, :sep, :oct, :nov, :dec

  def avg_daily_consumption
    [
      jan.to_f/31,
      feb.to_f/28,
      mar.to_f/31,
      apr.to_f/30,
      may.to_f/31,
      jun.to_f/30,
      jul.to_f/31,
      aug.to_f/31,
      sep.to_f/30,
      oct.to_f/31,
      nov.to_f/30,
      dec.to_f/31
    ]
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
