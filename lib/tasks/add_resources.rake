namespace :add_resources do
  desc "Adds Default Appliances to Database"
  task appliances: :environment do
    kitchen = Category.create(title: "kitchen")
    Appliance.create(name: "Refrigerator", avg_monthly_kwh: 57, category: kitchen)
    Appliance.create(name: "Freezer", avg_monthly_kwh: 58, category: kitchen)
    Appliance.create(name: "Dishwasher", avg_monthly_kwh: 13, category: kitchen)
    Appliance.create(name: "Range/Oven", avg_monthly_kwh: 24, category: kitchen)
    Appliance.create(name: "Microwave", avg_monthly_kwh: 11, category: kitchen)
    Appliance.create(name: "Coffee Machine", avg_monthly_kwh: 10, category: kitchen)
    Appliance.create(name: "Popcorn Maker", avg_monthly_kwh: 4, category: kitchen)
    Appliance.create(name: "Toaster Oven", avg_monthly_kwh: 9, category: kitchen)

    puts "Built Kitchen Appliances"

    well_pump = Category.create(title: "well pumps")
    Appliance.create(name: "Well Pump 1/2 HP", avg_monthly_kwh: 90, category: well_pump)
    Appliance.create(name: "Well Pump 3/4 HP", avg_monthly_kwh: 135, category: well_pump)
    Appliance.create(name: "Well Pump 1 HP", avg_monthly_kwh: 180, category: well_pump)
    Appliance.create(name: "Well Pump 1.5 HP", avg_monthly_kwh: 270, category: well_pump)
    Appliance.create(name: "Well Pump 5 HP", avg_monthly_kwh: 900, category: well_pump)

    puts "Built Well Pumps"

    entertainment = Category.create(title: "entertainment")
    Appliance.create(name: "TV 35 inch", avg_monthly_kwh: 10, category: entertainment)
    Appliance.create(name: "TV 45 inch", avg_monthly_kwh: 17, category: entertainment)
    Appliance.create(name: "TV 55 inch", avg_monthly_kwh: 25, category: entertainment)
    Appliance.create(name: "TV 60 inch", avg_monthly_kwh: 29, category: entertainment)
    Appliance.create(name: "Stereo", avg_monthly_kwh: 5, category: entertainment)
    Appliance.create(name: "CD Player", avg_monthly_kwh: 1, category: entertainment)
    Appliance.create(name: "Clock Radio", avg_monthly_kwh: 3, category: entertainment)
    Appliance.create(name: "MP3 Player", avg_monthly_kwh: 1, category: entertainment)
    Appliance.create(name: "Tablet", avg_monthly_kwh: 1, category: entertainment)
    Appliance.create(name: "Computer", avg_monthly_kwh: 21, category: entertainment)
    Appliance.create(name: "Mobile Phone", avg_monthly_kwh: 1, category: entertainment)
    Appliance.create(name: "Cordless Phone", avg_monthly_kwh: 2, category: entertainment)
    Appliance.create(name: "Blu-Ray / DVD Player", avg_monthly_kwh: 3, category: entertainment)
    Appliance.create(name: "DVR", avg_monthly_kwh: 23, category: entertainment)
    Appliance.create(name: "HD Receiver", avg_monthly_kwh: 14, category: entertainment)
    Appliance.create(name: "Satellite Dish", avg_monthly_kwh: 2, category: entertainment)
    Appliance.create(name: "Video Game System", avg_monthly_kwh: 15, category: entertainment)

    puts "Built Entertainment Appliances"

    cleaning = Category.create(title: "Cleaning")
    Appliance.create(name: "Washing Machine", avg_monthly_kwh: 6, category: cleaning)
    Appliance.create(name: "Clothes Dryer", avg_monthly_kwh: 57, category: cleaning)
    Appliance.create(name: "Vacuum Cleaner", avg_monthly_kwh: 3, category: cleaning)

    puts "Built Cleaning Appliances"

    heating = Category.create(title: "Heating")
    Appliance.create(name: "Electric Blanket", avg_monthly_kwh: 2, category: heating)
    Appliance.create(name: "Water Heater", avg_monthly_kwh: 405, category: heating)
    Appliance.create(name: "Furnace Fan", avg_monthly_kwh: 90, category: heating)
    Appliance.create(name: "Furn 15kW (~1100 Sq Ft)", avg_monthly_kwh: 1824, category: heating)
    Appliance.create(name: "Furn 20kW (~2000 Sq Ft)", avg_monthly_kwh: 2434, category: heating)
    Appliance.create(name: "Furn 25kW (~3000 Sq Ft)", avg_monthly_kwh: 3040, category: heating)
    Appliance.create(name: "Baseboard Heater (per linear feet)", avg_monthly_kwh: 45.6, category: heating)
    Appliance.create(name: "Wall Heaters (2000 W)", avg_monthly_kwh: 365, category: heating)
    Appliance.create(name: "Space Heater (1500 W)", avg_monthly_kwh: 274, category: heating)
    Appliance.create(name: "Heat Pump Fan", avg_monthly_kwh: 90, category: heating)
    Appliance.create(name: "Heat Pump (800-1100 Sq Ft)", avg_monthly_kwh: 1094, category: heating)
    Appliance.create(name: "Heat Pump (1100-2000 Sq Ft)", avg_monthly_kwh: 1460, category: heating)
    Appliance.create(name: "Heat Pump (2000-3000 Sq Ft)", avg_monthly_kwh: 1824, category: heating)

    puts "Built Heating Appliances"

    cooling = Category.create(title: "Cooling")
    Appliance.create(name: "Portable Fan", avg_monthly_kwh: 6, category: cooling)
    Appliance.create(name: "Window Air Conditioner", avg_monthly_kwh: 134, category: cooling)
    Appliance.create(name: "Ceiling Fan", avg_monthly_kwh: 85, category: cooling)

    puts "Built Cooling Appliances"

    ventilation = Category.create(title: "Ventilation")
    Appliance.create(name: "Air Purifier", avg_monthly_kwh: 49, category: ventilation)
    Appliance.create(name: "Dehumidifier", avg_monthly_kwh: 21, category: ventilation)
    Appliance.create(name: "Humidifier", avg_monthly_kwh: 5, category: ventilation)

    puts "Build Ventilation Appliances"

    misc = Category.create(title: "miscellaneous")
    Appliance.create(name: "Lighting (per Room)", avg_monthly_kwh: 10, category: misc)
    Appliance.create(name: "Nightlight", avg_monthly_kwh: 1, category: misc)
    Appliance.create(name: "Aquarium", avg_monthly_kwh: 460, category: misc)
    Appliance.create(name: "Hot Tub", avg_monthly_kwh: 600, category: misc)
    Appliance.create(name: "Water Bed Heater", avg_monthly_kwh: 175, category: misc)

    puts "Built Misc Appliances"

    vehicles = Category.create(title: "vehicles")
    Appliance.create(name: "Electric Car (per 100 miles)", avg_monthly_kwh: 30, category: vehicles)
    Appliance.create(name: "Electric Bicycle (per 50 miles)", avg_monthly_kwh: 1, category: vehicles)

    puts "Built Vehicles"
  end
end
