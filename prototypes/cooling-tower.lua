
data:extend(
{
  {
    type = "recipe",
    name = "cooling-tower",
    ingredients =
    {
      {"pipe", 9},
      {"iron-plate", 12},
      -- {"concrete", 48},
    },
    result = "cooling-tower"
  },
  {
    type = "item",
    name = "cooling-tower",
    icon = "__power-facilities__/graphics/icons/steam-turbine-basic.png",
    flags = {"goes-to-quickbar"},
    subgroup = "energy",
    order = "b[steam-power]-b[cooling-tower]",
    place_result = "cooling-tower",
    stack_size = 10
  },
  {
    type = "storage-tank",
    name = "cooling-tower",
    icon = "__base__/graphics/icons/storage-tank.png",
    flags = {"placeable-player", "player-creation"},
    minable = {hardness = 0.2, mining_time = 3, result = "cooling-tower"},
    max_health = 500,
    order = "a",
    corpse = "medium-remnants",
    collision_box = {{-1.3, -1.3}, {1.3, 1.3}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    fluid_box =
    {
      base_area = 9,
      pipe_covers = pipecoverspictures(),
      pipe_connections =
      {
        { position = {-2, -1}, type="input" },
        { position = {-2,  1}, type="input" },
        { position = { 2, -1}, type="output" },
        { position = { 2,  1}, type="output" },
      },
    },
    window_bounding_box = {{-0.125, 0.6875}, {0.1875, 1.1875}},
    pictures =
    {
      picture =
      {
        sheet =
        {
          filename = "__base__/graphics/entity/storage-tank/storage-tank.png",
          priority = "extra-high",
          frames = 2,
          width = 140,
          height = 115,
          shift = {0.6875, 0.109375}
        }
      },
      fluid_background =
      {
        filename = "__base__/graphics/entity/storage-tank/fluid-background.png",
        priority = "extra-high",
        width = 32,
        height = 15
      },
      window_background =
      {
        filename = "__base__/graphics/entity/storage-tank/window-background.png",
        priority = "extra-high",
        width = 17,
        height = 24
      },
      flow_sprite =
      {
        filename = "__base__/graphics/entity/pipe/fluid-flow-low-temperature.png",
        priority = "extra-high",
        width = 160,
        height = 20
      }
    },
    flow_length_in_ticks = 360,
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    working_sound =
    {
      sound = {
          filename = "__base__/sound/storage-tank.ogg",
          volume = 0.8
      },
      apparent_volume = 1.5,
      max_sounds_per_type = 3
    },
    circuit_wire_connection_points =
    {
      {
        shadow =
        {
          red = {2.6875, 1.3125},
          green = {2.6875, 1.3125},
        },
        wire =
        {
          red = {1.1875, -0.28125},
          green = {1.1875, -0.28125},
        }
      },
      {
        shadow =
        {
          red = {0.21875, 1.1875},
          green = {0.21875, 1.1875},
        },
        wire =
        {
          red = {-1, -0.25},
          green = {-1, -0.25},
        }
      },
      {
        shadow =
        {
          red = {2.6875, 1.3125},
          green = {2.6875, 1.3125},
        },
        wire =
        {
          red = {1.1875, -0.28125},
          green = {1.1875, -0.28125},
        }
      },
      {
        shadow =
        {
          red = {0.21875, 1.1875},
          green = {0.21875, 1.1875},
        },
        wire =
        {
          red = {-1, -0.25},
          green = {-1, -0.25},
        }
      }
    },

    circuit_wire_max_distance = 7.5
  },
}
)
