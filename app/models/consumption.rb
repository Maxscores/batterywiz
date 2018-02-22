class Consumption < ApplicationRecord
  belongs_to :installation

  validates_presence_of :jan, :feb, :mar, :apr, :may, :jun, :jul, :aug, :sep, :oct, :nov, :dec
end
