
 -- Entity: steam-turbine
 -- Entity: advanced-steam-turbine

data:extend(
{
  {
    type = "recipe",
    name = "steam-turbine-basic",
    ingredients =
    {
      {"electric-dynamo", 3},
      {"pipe", 5},
      {"iron-plate", 12},
      -- {"concrete", 48},
    },
    result = "steam-turbine-basic"
  },
  {
    type = "item",
    name = "steam-turbine-basic",
    icon = "__power-facilities__/graphics/icons/steam-turbine-basic.png",
    flags = {"goes-to-quickbar"},
    subgroup = "energy",
    order = "b[steam-power]-b[steam-turbine-basic]",
    place_result = "steam-turbine-basic",
    stack_size = 10
  },
  {
    type = "generator",
    name = "steam-turbine-basic",
    icon = "__power-facilities__/graphics/icons/steam-turbine-basic.png",
    flags = {"placeable-neutral","player-creation"},
    minable = {mining_time = 1, result = "steam-turbine-basic"},
    max_health = 300,
    corpse = "big-remnants",
    dying_explosion = "medium-explosion",
    effectivity = 1,
    fluid_usage_per_tick = 10,
    resistances =
    {
      {
        type = "fire",
        percent = 90
      }
    },
    collision_box = {{-1.5, -1.5}, {1.5, 1.5}},
    selection_box = {{-2.5, -5}, {2.5, 2}},
    fluid_box =
    {
      base_area = 1,
      pipe_covers = pipecoverspictures(),
      pipe_connections =
      {
        { position = {0, 2} },
        { position = {-2, 0} },
        { position = {2, 0} },
        -- { position = {0, -2} },
      },
    },
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-output"
    },
    horizontal_animation =
    {
      filename = "__power-facilities__/graphics/entity/steam-turbine-basic/steam-turbine-basic.png",
      width = 155,
      height = 239,
      frame_count = 1,
      line_length = 1,
      shift = {0, -1.5}
    },
    vertical_animation =
    {
      filename = "__power-facilities__/graphics/entity/steam-turbine-basic/steam-turbine-basic.png",
      width = 155,
      height = 239,
      frame_count = 1,
      line_length = 1,
      shift = {0, -1.5}
    },
    smoke =
    {
      {
        name = "light-smoke",
        north_position = {0.9, 0.0},
        east_position = {-2.0, -2.0},
        frequency = 10 / 32,
        starting_vertical_speed = 0.08,
        slow_down_factor = 1,
        starting_frame_deviation = 60
      }
    },
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    working_sound =
    {
      sound =
      {
        filename = "__base__/sound/steam-engine-90bpm.ogg",
        volume = 0.3
      },
      match_speed_to_activity = true,
    },
    min_perceived_performance = 0.25,
    performance_to_sound_speedup = 0.5
  }

  -- {
  --   type = "generator",
  --   name = "steam-turbine",
  --   icon = "__power-facilities__/graphics/icons/steam-turbine.png",
  --   flags = {"placeable-neutral","player-creation"},
  --   minable = {mining_time = 1, result = "steam-turbine"},
  --   max_health = 300,
  --   corpse = "big-remnants",
  --   dying_explosion = "medium-explosion",
  --   effectivity = 1,
  --   fluid_usage_per_tick = 12,
  --   resistances =
  --   {
  --     {
  --       type = "fire",
  --       percent = 90
  --     }
  --   },
  --   collision_box = {{-1.35, -1.35}, {1.35, 1.35}},
  --   selection_box = {{-1.5, -1.5,}, {1.5, 1.5}},
  --   fluid_box =
  --   {
  --     base_area = 1,
  --     pipe_covers = pipecoverspictures(),
  --     pipe_connections =
  --     {
  --       { position = {0, 3} },
  --       { position = {0, -3} },
  --       -- { position = {-1, 0} },
  --       -- { position = {0, -1} },
  --       -- { position = {0, 1} },
  --       -- { position = {1, 0} },
  --     },
  --   },
  --   energy_source =
  --   {
  --     type = "electric",
  --     usage_priority = "secondary-output"
  --   },
  --   horizontal_animation =
  --   {
  --     filename = "__power-facilities__/graphics/entity/steam-turbine/steam-turbine.png",
  --     width = 246,
  --     height = 137,
  --     frame_count = 32,
  --     line_length = 8,
  --     shift = {1.34, -0.06}
  --   },
  --   -- vertical_animation =
  --   -- {
  --   --   filename = "__power-facilities__/graphics/entity/steam-turbine/steam-turbine.png",
  --   --   width = 155,
  --   --   height = 186,
  --   --   frame_count = 32,
  --   --   line_length = 8,
  --   --   shift = {0.812, 0.03125}
  --   -- },
  --   smoke =
  --   {
  --     {
  --       name = "light-smoke",
  --       north_position = {0.9, 0.0},
  --       east_position = {-2.0, -2.0},
  --       frequency = 10 / 32,
  --       starting_vertical_speed = 0.08,
  --       slow_down_factor = 1,
  --       starting_frame_deviation = 60
  --     }
  --   },
  --   vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
  --   -- working_sound =
  --   -- {
  --   --   sound =
  --   --   {
  --   --     filename = "__power-facilities__/sound/steam-turbine-90bpm.ogg",
  --   --     volume = 0.6
  --   --   },
  --   --   match_speed_to_activity = true,
  --   -- },
  --   min_perceived_performance = 0.25,
  --   performance_to_sound_speedup = 0.5
  -- },
--   {
--     type = "generator",
--     name = "advanced-steam-turbine",
--     icon = "__power-facilities__/graphics/icons/advanced-steam-turbine.png",
--     flags = {"placeable-neutral","player-creation"},
--     minable = {mining_time = 1, result = "advanced-steam-turbine"},
--     max_health = 300,
--     corpse = "big-remnants",
--     dying_explosion = "medium-explosion",
--     effectivity = 1,
--     fluid_usage_per_tick = 2,
--     resistances =
--     {
--       {
--         type = "fire",
--         percent = 90
--       }
--     },
--     collision_box = {{-1.35, -1.35}, {1.35, 1.35}},
--     selection_box = {{-1.5, -1.5,}, {1.5, 1.5}},
--     fluid_box =
--     {
--       base_area = 1,
--       pipe_covers = pipecoverspictures(),
--       pipe_connections =
--       {
--         { position = {-1, 0} },
--         { position = {0, -1} },
--         { position = {0, 1} },
--         { position = {1, 0} },
--       },
--     },
--     energy_source =
--     {
--       type = "electric",
--       usage_priority = "secondary-output"
--     },
--     horizontal_animation =
--     {
--       filename = "__power-facilities__/graphics/entity/advanced-steam-turbine/advanced-steam-turbine.png",
--       width = 246,
--       height = 137,
--       frame_count = 32,
--       line_length = 8,
--       shift = {1.34, -0.06}
--     },
--     -- vertical_animation =
--     -- {
--     --   filename = "__power-facilities__/graphics/entity/advanced-steam-turbine/advanced-steam-turbine.png",
--     --   width = 155,
--     --   height = 186,
--     --   frame_count = 32,
--     --   line_length = 8,
--     --   shift = {0.812, 0.03125}
--     -- },
--     smoke =
--     {
--       {
--         name = "light-smoke",
--         north_position = {0.9, 0.0},
--         east_position = {-2.0, -2.0},
--         frequency = 10 / 32,
--         starting_vertical_speed = 0.08,
--         slow_down_factor = 1,
--         starting_frame_deviation = 60
--       }
--     },
--     vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
--     -- working_sound =
--     -- {
--     --   sound =
--     --   {
--     --     filename = "__power-facilities__/sound/steam-turbine-90bpm.ogg",
--     --     volume = 0.6
--     --   },
--     --   match_speed_to_activity = true,
--     -- },
--     min_perceived_performance = 0.25,
--     performance_to_sound_speedup = 0.5
--   },
}
)
