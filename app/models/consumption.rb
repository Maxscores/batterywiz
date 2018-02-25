class Consumption < ApplicationRecord
  belongs_to :installation

  validates_presence_of :jan, :feb, :mar, :apr, :may, :jun, :jul, :aug, :sep, :oct, :nov, :dec

  def by_month
    [jan, feb, mar, apr, may, jun, jul, aug, sep, oct, nov, dec]
  end

  def avg_daily_consumption
    [
      jan.to_i/31,
      feb.to_i/28,
      mar.to_i/31,
      apr.to_i/30,
      may.to_i/31,
      jun.to_i/30,
      jul.to_i/31,
      aug.to_i/31,
      sep.to_i/30,
      oct.to_i/31,
      nov.to_i/30,
      dec.to_i/31
    ]
  end
end
