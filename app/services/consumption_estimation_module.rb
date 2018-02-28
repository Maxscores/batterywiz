module ConsumptionEstimationModule
  def estimate_consumption(avg_daily_consumption)
    (1..12).map do |month|
      (1..Time.days_in_month(month)).map do
        #add winter/summer month selection
        default_consumption_profile.map do |hour_consumption|
          (avg_daily_consumption[month-1] * hour_consumption).round(2)
        end
      end
    end.flatten(1)
  end

  def summer_consumption_profile
    standardize_consumption_profile([])
  end

  def winter_consumption_profile
    standardize_consumption_profile([])
  end

  def default_consumption_profile
    standardize_consumption_profile([3.9,
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
                                      2.4])
  end

  def standardize_consumption_profile(profile)
    profile.map {|num| num / profile.sum}
  end
end
