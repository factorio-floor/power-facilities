
data:extend(
{
  {
    type = "recipe-category",
    name = "thermonuclear-reactor"
  },
  {
    type = "recipe",
    name = "thermonuclear-heat",
    category = "thermonuclear-reactor",
    ingredients =
    {
      {"uranium-fuel-rod-purified", 1},
      {"uranium-fuel-rod-purified", 1},
      {type="fluid", name="water", amount=30},

    },
    results = {
      {type="fluid", name="steam", amount=30}
    },
    -- subgroup = "fluid-recipes"
  },
  {
    type = "recipe",
    name = "nuclear-reactor",
    ingredients =
    {
      {"pipe", 48},
      {"iron-plate", 96},
      {"steel-plate", 102},
      {"plastic-bar", 24},
      {"processing-unit", 20},
      {"advanced-circuit", 95},
      {"electronic-circuit", 468},
      {"copper-cable", 600},

    },
    result = "nuclear-reactor"
  },
  {
    type = "item",
    name = "nuclear-reactor",
    icon = "__power-facilities__/graphics/icons/radiation-warning-symbol.png",
    flags = {"goes-to-quickbar"},
    subgroup = "energy",
    order = "b[steam-power]-b[nuclear-reactor]",
    place_result = "nuclear-reactor",
    stack_size = 1
  },
  {
    type = "assembling-machine",
    name = "nuclear-reactor",
    icon = "__power-facilities__/graphics/icons/radiation-warning-symbol.png",
    flags = {"placeable-neutral","player-creation"},
    minable = {mining_time = 6, result = "nuclear-reactor"},
    max_health = 1200,
    corpse = "big-remnants",
    dying_explosion = "medium-explosion",
    collision_box = {{-2.4, -2.4}, {2.4, 2.4}},
    selection_box = {{-2.5, -2.5}, {2.5, 2.5}},
    module_specification =
    {
      module_slots = 0
    },
    allowed_effects = nil,
    crafting_categories = {"thermonuclear-reactor"},
    crafting_speed = 1,
    has_backer_name = true,
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      emissions = 0.03 / 3.5
    },
    energy_usage = "420kW",
    ingredient_count = 3,
    animation =
    {
      north =
      {
        filename = "__power-facilities__/graphics/entity/nuclear-reactor/nuclear-reactor.png",
        width = 337,
        height = 255,
        frame_count = 1,
        shift = {2.515625, 0.484375}
      },
      east =
      {
        filename = "__power-facilities__/graphics/entity/nuclear-reactor/nuclear-reactor.png",
        x = 337,
        width = 337,
        height = 255,
        frame_count = 1,
        shift = {2.515625, 0.484375}
      },
      south =
      {
        filename = "__power-facilities__/graphics/entity/nuclear-reactor/nuclear-reactor.png",
        x = 674,
        width = 337,
        height = 255,
        frame_count = 1,
        shift = {2.515625, 0.484375}
      },
      west =
      {
        filename = "__power-facilities__/graphics/entity/nuclear-reactor/nuclear-reactor.png",
        x = 1011,
        width = 337,
        height = 255,
        frame_count = 1,
        shift = {2.515625, 0.484375}
      }
    },
    working_visualisations =
    {
      {
        north_position = {1.03125, -1.55},
        east_position = {-1.65625, -1.3},
        south_position = {-1.875, -2.0},
        west_position = {1.8437, -1.2},
        animation =
        {
          filename = "__power-facilities__/graphics/entity/nuclear-reactor/nuclear-reactor-fire.png",
          frame_count = 29,
          width = 16,
          height = 35,
          scale = 1.5,
          shift = {0, -0.5625},
          run_mode="backward"
        },
        light = {intensity = 0.4, size = 6}
      }
    },
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    working_sound =
    {
      sound = { filename = "__base__/sound/idle1.ogg" },
      idle_sound = { filename = "__base__/sound/idle1.ogg", volume = 0.6 },
      apparent_volume = 2.5,
    },
    fluid_boxes =
    {
      -- coolant
      {
        base_area = 4,
        pipe_covers = pipecoverspictures(),
        pipe_connections =
        {
          { position = { 2, -3}, type="input" },
          { position = { 0, -3}, type="input" },
          { position = {-3,  2}, type="output" },
          { position = {-3,  0}, type="output" },
        },
      },
      -- heating element
      {
        base_area = 4,
        pipe_covers = pipecoverspictures(),
        pipe_connections =
        {
          { position = { 1,  3}, type="input" },
          { position = {-1,  3}, type="input" },
          { position = { 3, -1}, type="output" },
          { position = { 3,  1}, type="output" },
        },
      },
    },
    pipe_covers = pipecoverspictures()
  }
  -- {
  --   type = "storage-tank",
  --   name = "nuclear-reactor",
  --   icon = "__power-facilities__/graphics/icons/radiation-warning-symbol.png",
  --   flags = {"placeable-player", "player-creation"},
  --   minable = {hardness = 0.8, mining_time = 7, result = "nuclear-reactor"},
  --   order = "a",
  --   max_health = 1200,
  --   corpse = "big-remnants",
  --   dying_explosion = "medium-explosion",
  --   collision_box = {{-2.4, -2.4}, {2.4, 2.4}},
  --   selection_box = {{-2.5, -2.5}, {2.5, 2.5}},
  --   result_inventory_size = 2,
  --   source_inventory_size = 2,
  --   energy_usage = "350kW",
  --   energy_source =
  --   {
  --     type = "electric",
  --     usage_priority = "secondary-input"
  --   },
  --   fluid_box =
  --   {
  --     -- coolant
  --     {
  --       base_area = 4,
  --       pipe_covers = pipecoverspictures(),
  --       pipe_connections =
  --       {
  --         { position = { 1, -3}, type="input" },
  --         { position = { 0, -3}, type="input" },
  --         { position = {-1, -3}, type="input" },
  --         { position = {-3,  1}, type="output" },
  --         { position = {-3,  0}, type="output" },
  --         { position = {-3, -1}, type="output" },
  --       },
  --     },
  --     -- heating element
  --     {
  --       base_area = 4,
  --       pipe_covers = pipecoverspictures(),
  --       pipe_connections =
  --       {
  --         { position = { 0,  3}, type="input" },
  --         { position = {-1,  3}, type="input" },
  --         { position = { 3,  1}, type="output" },
  --         { position = { 3,  0}, type="output" },
  --       },
  --     },
  --   },
  --   window_bounding_box = {{-0.125, 0.6875}, {0.1875, 1.1875}},
  --   pictures =
  --   {
  --     picture =
  --     {
  --       sheet =
  --       {
  --         filename = "__power-facilities__/graphics/entity/nuclear-reactor/nuclear-reactor.png",
  --         priority = "extra-high",
  --         width = 337,
  --         height = 255,
  --         frames = 1,
  --         shift = {2.515625, 0.484375}
  --       }
  --     },
  --     fluid_background =
  --     {
  --       filename = "__power-facilities__/graphics/none.png",
  --       priority = "extra-high",
  --       width = 1,
  --       height = 1
  --     },
  --     window_background =
  --     {
  --       filename = "__power-facilities__/graphics/none.png",
  --       priority = "extra-high",
  --       width = 1,
  --       height = 1
  --     },
  --     flow_sprite =
  --     {
  --       filename = "__power-facilities__/graphics/none.png",
  --       priority = "extra-high",
  --       width = 1,
  --       height = 1
  --     }
  --   },
  --   flow_length_in_ticks = 360,
  --   vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
  --   working_sound =
  --   {
  --     sound = {
  --         filename = "__base__/sound/storage-tank.ogg",
  --         volume = 0.8
  --     },
  --     apparent_volume = 1.5,
  --     max_sounds_per_type = 3
  --   },
  --   circuit_wire_connection_points =
  --   {
  --     {
  --       shadow =
  --       {
  --         red = {2.6875, 1.3125},
  --         green = {2.6875, 1.3125},
  --       },
  --       wire =
  --       {
  --         red = {1.1875, -0.28125},
  --         green = {1.1875, -0.28125},
  --       }
  --     },
  --     {
  --       shadow =
  --       {
  --         red = {0.21875, 1.1875},
  --         green = {0.21875, 1.1875},
  --       },
  --       wire =
  --       {
  --         red = {-1, -0.25},
  --         green = {-1, -0.25},
  --       }
  --     },
  --     {
  --       shadow =
  --       {
  --         red = {2.6875, 1.3125},
  --         green = {2.6875, 1.3125},
  --       },
  --       wire =
  --       {
  --         red = {1.1875, -0.28125},
  --         green = {1.1875, -0.28125},
  --       }
  --     },
  --     {
  --       shadow =
  --       {
  --         red = {0.21875, 1.1875},
  --         green = {0.21875, 1.1875},
  --       },
  --       wire =
  --       {
  --         red = {-1, -0.25},
  --         green = {-1, -0.25},
  --       }
  --     }
  --   },

  --   circuit_wire_max_distance = 7.5
  -- },
}
)
