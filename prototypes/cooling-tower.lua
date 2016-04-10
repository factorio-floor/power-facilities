
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
    icon = "__power-facilities__/graphics/icons/cooling-tower.png",
    flags = {"goes-to-quickbar"},
    subgroup = "energy",
    order = "b[steam-power]-b[cooling-tower]",
    place_result = "cooling-tower",
    stack_size = 10
  },
  {
    type = "storage-tank",
    name = "cooling-tower",
    icon = "__power-facilities__/graphics/icons/cooling-tower.png",
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
          filename = "__power-facilities__/graphics/entity/cooling-tower/cooling-tower.png",
          priority = "extra-high",
          width = 188,
          height = 182,
          frames = 1,
          shift = {0, 0.12}
        }
      },
      fluid_background =
      {
        filename = "__power-facilities__/graphics/none.png",
        priority = "extra-high",
        width = 1,
        height = 1
      },
      window_background =
      {
        filename = "__power-facilities__/graphics/none.png",
        priority = "extra-high",
        width = 1,
        height = 1
      },
      flow_sprite =
      {
        filename = "__power-facilities__/graphics/none.png",
        priority = "extra-high",
        width = 1,
        height = 1
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
