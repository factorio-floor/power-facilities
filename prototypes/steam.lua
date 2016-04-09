
data:extend(
{
  {
    type = "fluid",
    name = "steam",
    default_temperature = 100,
    max_temperature = 400,
    heat_capacity = "1KJ",
    base_color = {r=0.5, g=0.5, b=1},
    flow_color = {r=0.9, g=0.9, b=0.9},
    icon = "__base__/graphics/icons/fluid/water.png",
    order = "a[fluid]-a[water]",
    pressure_to_speed_ratio = 0.4,
    flow_to_energy_ratio = 0.59,
  }
})
