-- Resource: uranium ore
-- Item: uranium ore
require "prototypes.resources.uranium-ore"

data:extend(
{
  {
    type = "recipe-category",
    name = "nuclear processing"
  },
  -- Basic:
  -- Item: pulped uranium ore
  -- Item: yellowcake (U₃O₈)
  -- Item: purified uranium (UO₂)

  {
    type = "item",
    name = "pulped uranium ore",
    icon = "__power-facilities__/graphics/icons/pulped uranium ore.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "raw-material",
    order = "f-a[uranium-ore]",
    stack_size = 40
  },
  {
    type = "item",
    name = "yellowcake",
    icon = "__power-facilities__/graphics/icons/yellowcake.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "raw-material",
    order = "f-a[uranium-ore]",
    stack_size = 200
  },
  {
    type = "item",
    name = "purified uranium",
    icon = "__power-facilities__/graphics/icons/purified uranium.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "raw-material",
    order = "f-a[uranium-ore]",
    stack_size = 40
  },

  {
    type = "recipe",
    name = "yellowcake",
    category = "advanced-crafting", -- chemistry
    ingredients = {
      {type="fluid", name="sulfuric acid"}, -- acid, alkaline, peroxide
      {name="pulped uranium ore"},
    },
    result = "yellowcake",
  },
  {
    type = "recipe",
    name = "purified uranium",
    category = "smelting",
    ingredients = {
      "yellowcake",
    },
    results = "purified uranium"
  },

  -- Advanced:
  -- Item: uranyl nitrate
  -- Item: uranium hexafluoride (UF₆)
  -- Item: enriched uranium-235
  -- Item: depleted uranium (DU)
  {
    type = "fluid",
    name = "uranyl nitrate",
    default_temperature = 45,
    max_temperature = 100,
    heat_capacity = "0.5KJ",
    base_color = {r=.56, g=0.66, b=0.58},
    flow_color = {r=.56, g=0.66, b=0.58},
    icon = "__power-facilities__/graphics/icons/fluid/uranyl nitrate.png",
    order = "a[fluid]-a[uranyl nitrate]",
    pressure_to_speed_ratio = 0.4,
    flow_to_energy_ratio = 0.59,
  },
  {
    type = "fluid",
    name = "uranium hexafluoride",
    default_temperature = 45,
    max_temperature = 100,
    heat_capacity = "0.5KJ",
    base_color = {r=.98, g=0.87, b=0.87},
    flow_color = {r=.98, g=0.87, b=0.87},
    icon = "__power-facilities__/graphics/icons/fluid/uranium hexafluoride.png",
    order = "a[fluid]-a[uranium hexafluoride]",
    pressure_to_speed_ratio = 0.4,
    flow_to_energy_ratio = 0.59,
  },
  {
    type = "item",
    name = "depleted uranium",
    icon = "__power-facilities__/graphics/icons/depleted uranium.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "raw-material",
    order = "f-a[uranium-ore]",
    stack_size = 200
  },
  {
    type = "item",
    name = "enriched uranium",
    icon = "__power-facilities__/graphics/icons/enriched uranium.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "raw-material",
    order = "f-a[uranium-ore]",
    stack_size = 40
  },

  {
    type = "recipe",
    name = "uranyl nitrate",
    category = "advanced-crafting", -- chemistry
    ingredients = {
      {type="fluid", name="sulfuric acid"}, -- acid, alkaline, peroxide
      {name="yellowcake"},
    },
    results = {
      {type="fluid", name="uranyl nitrate"},
    }
  },
  {
    type = "recipe",
    name = "uranium hexafluoride",
    category = "chemistry",
    ingredients = {
      {type="fluid", name="sulfuric acid"},
      {type="fluid", name="uranyl nitrate"},
      {type="fluid", name="water"},
    },
    results = {
      {type="fluid", name="uranium hexafluoride"},
    },
  },
  {
    type = "recipe",
    name = "enriched uranium",
    category = "gas centrifuge",
    ingredients = {
      {type="fluid", name="uranium hexafluoride", amount=100},
    },
    results = {
      {type="item", name="enriched uranium", amount=1},
      {type="fluid", name="uranium hexafluoride", amount=3},
      {type="item", name="depleted uranium", amount=96},
    },
  },

  -- Entity: gas centrifuge
  {
    type = "assembling-machine",
    name = "gas-centrifuge",
    icon = "__power-facilities__/graphics/icons/gas-centrifuge.png",
    flags = {"placeable-neutral","placeable-player", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = "gas-centrifuge"},
    max_health = 300,
    corpse = "big-remnants",
    dying_explosion = "medium-explosion",
    collision_box = {{-1.4, -1.4}, {1.4, 1.4}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    module_specification =
    {
      module_slots = 2
    },
    allowed_effects = {"consumption", "speed", "productivity", "pollution"},
    animation =
    {
      north =
      {
        filename = "__power-facilities__/graphics/entity/gas-centrifuge/gas-centrifuge.png",
        width = 156,
        height = 141,
        frame_count = 1,
        shift = {0.5, -0.078125}
      },
      west =
      {
        filename = "__power-facilities__/graphics/entity/gas-centrifuge/gas-centrifuge.png",
        x = 468,
        width = 156,
        height = 141,
        frame_count = 1,
        shift = {0.5, -0.078125}
      },
      south =
      {
        filename = "__power-facilities__/graphics/entity/gas-centrifuge/gas-centrifuge.png",
        x = 312,
        width = 156,
        height = 141,
        frame_count = 1,
        shift = {0.5, -0.078125}
      },
      east =
      {
        filename = "__power-facilities__/graphics/entity/gas-centrifuge/gas-centrifuge.png",
        x = 156,
        width = 156,
        height = 141,
        frame_count = 1,
        shift = {0.5, -0.078125}
      }
    },
    -- working_visualisations =
    -- {
    --   {
    --     north_position = {0.94, -0.73},
    --     west_position = {0.05, -1.46},
    --     south_position = {-0.97, -1.47},
    --     east_position = {-0.3, 0.02},
    --     animation =
    --     {
    --       filename = "__power-facilities__/graphics/entity/gas-centrifuge/boiling-green-patch.png",
    --       frame_count = 35,
    --       width = 17,
    --       height = 12,
    --       animation_speed = 0.15
    --     }
    --   },
    --   {
    --     north_position = {1.4, -0.23},
    --     west_position = {0.05, -0.96},
    --     south_position = {-1, -1},
    --     east_position = {-0.3, 0.55},
    --     north_animation =
    --     {
    --       filename = "__power-facilities__/graphics/entity/gas-centrifuge/boiling-window-green-patch.png",
    --       frame_count = 1,
    --       width = 21,
    --       height = 10
    --     },
    --     east_animation =
    --     {
    --       filename = "__power-facilities__/graphics/entity/gas-centrifuge/boiling-window-green-patch.png",
    --       x = 21,
    --       frame_count = 1,
    --       width = 21,
    --       height = 10
    --     },
    --     south_animation =
    --     {
    --       filename = "__power-facilities__/graphics/entity/gas-centrifuge/boiling-window-green-patch.png",
    --       x = 42,
    --       frame_count = 1,
    --       width = 21,
    --       height = 10
    --     }
    --   }
    -- },
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    -- working_sound =
    -- {
    --   sound =
    --   {
    --     {
    --       filename = "__power-facilities__/sound/gas-centrifuge.ogg",
    --       volume = 0.8
    --     }
    --   },
    --   idle_sound = { filename = "__power-facilities__/sound/idle1.ogg", volume = 0.6 },
    --   apparent_volume = 1.5,
    -- },
    crafting_speed = 1.25,
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      emissions = 0.03 / 3.5
    },
    energy_usage = "210kW",
    ingredient_count = 4,
    crafting_categories = {"gas-centrifuge"},
    fluid_boxes =
    {
      {
        production_type = "input",
        pipe_covers = pipecoverspictures(),
        base_area = 10,
        base_level = -1,
        pipe_connections = {{ type="input", position = {-1, -2} }}
      },
      {
        production_type = "input",
        pipe_covers = pipecoverspictures(),
        base_area = 10,
        base_level = -1,
        pipe_connections = {{ type="input", position = {1, -2} }}
      },
      {
        production_type = "output",
        pipe_covers = pipecoverspictures(),
        base_level = 1,
        pipe_connections = {{ position = {-1, 2} }}
      },
      {
        production_type = "output",
        pipe_covers = pipecoverspictures(),
        base_level = 1,
        pipe_connections = {{ position = {1, 2} }}
      }
    }
  },

  {
    type = "recipe",
    name = "uranium hexafluoride barrel",
    category = "crafting",
    ingredients = {
      {type="fluid", name="uranium hexafluoride", amount=25},
      {type="item", name="empty-barrel"},
    },
    results = {
      {type="item", name="uranium hexafluoride barrel", amount=1},
    },
  },
  {
    type = "recipe",
    name = "uranium hexafluoride barrel",
    category = "crafting",
    ingredients = {
      {type="item", name="uranium hexafluoride barrel", amount=1},
    },
    results = {
      {type="fluid", name="uranium hexafluoride", amount=25},
      {type="item", name="empty-barrel"},
    },
  },


  -- Item: electric generator
  -- Item: advanced electric generator
  {
    type = "item",
    name = "electric generator",
    icon = "__power-facilities__/graphics/icons/electric generator.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "raw-material",
    order = "f-a[uranium-ore]",
    stack_size = 10
  },
  {
    type = "item",
    name = "advanced electric generator",
    icon = "__power-facilities__/graphics/icons/advanced electric generator.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "raw-material",
    order = "f-a[uranium-ore]",
    stack_size = 10
  },
  -- Entity: steam turbine
  -- Entity: advanced steam turbine
  {
    type = "generator",
    name = "steam turbine",
    icon = "__power-facilities__/graphics/icons/steam turbine.png",
    flags = {"placeable-neutral","player-creation"},
    minable = {mining_time = 1, result = "steam turbine"},
    max_health = 300,
    corpse = "big-remnants",
    dying_explosion = "medium-explosion",
    effectivity = 1,
    fluid_usage_per_tick = 2,
    resistances =
    {
      {
        type = "fire",
        percent = 90
      }
    },
    collision_box = {{-1.35, -1.35}, {1.35, 1.35}},
    selection_box = {{-1.5, -1.5,}, {1.5, 1.5}},
    fluid_box =
    {
      base_area = 1,
      pipe_covers = pipecoverspictures(),
      pipe_connections =
      {
        { position = {-1, 0} },
        { position = {0, -1} },
        { position = {0, 1} },
        { position = {1, 0} },
      },
    },
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-output"
    },
    horizontal_animation =
    {
      filename = "__power-facilities__/graphics/entity/steam turbine/steam turbine.png",
      width = 246,
      height = 137,
      frame_count = 32,
      line_length = 8,
      shift = {1.34, -0.06}
    },
    -- vertical_animation =
    -- {
    --   filename = "__power-facilities__/graphics/entity/steam turbine/steam turbine.png",
    --   width = 155,
    --   height = 186,
    --   frame_count = 32,
    --   line_length = 8,
    --   shift = {0.812, 0.03125}
    -- },
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
    -- working_sound =
    -- {
    --   sound =
    --   {
    --     filename = "__power-facilities__/sound/steam turbine-90bpm.ogg",
    --     volume = 0.6
    --   },
    --   match_speed_to_activity = true,
    -- },
    min_perceived_performance = 0.25,
    performance_to_sound_speedup = 0.5
  },
  {
    type = "generator",
    name = "advanced steam turbine",
    icon = "__power-facilities__/graphics/icons/advanced steam turbine.png",
    flags = {"placeable-neutral","player-creation"},
    minable = {mining_time = 1, result = "advanced steam turbine"},
    max_health = 300,
    corpse = "big-remnants",
    dying_explosion = "medium-explosion",
    effectivity = 1,
    fluid_usage_per_tick = 2,
    resistances =
    {
      {
        type = "fire",
        percent = 90
      }
    },
    collision_box = {{-1.35, -1.35}, {1.35, 1.35}},
    selection_box = {{-1.5, -1.5,}, {1.5, 1.5}},
    fluid_box =
    {
      base_area = 1,
      pipe_covers = pipecoverspictures(),
      pipe_connections =
      {
        { position = {-1, 0} },
        { position = {0, -1} },
        { position = {0, 1} },
        { position = {1, 0} },
      },
    },
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-output"
    },
    horizontal_animation =
    {
      filename = "__power-facilities__/graphics/entity/advanced steam turbine/advanced steam turbine.png",
      width = 246,
      height = 137,
      frame_count = 32,
      line_length = 8,
      shift = {1.34, -0.06}
    },
    -- vertical_animation =
    -- {
    --   filename = "__power-facilities__/graphics/entity/advanced steam turbine/advanced steam turbine.png",
    --   width = 155,
    --   height = 186,
    --   frame_count = 32,
    --   line_length = 8,
    --   shift = {0.812, 0.03125}
    -- },
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
    -- working_sound =
    -- {
    --   sound =
    --   {
    --     filename = "__power-facilities__/sound/steam turbine-90bpm.ogg",
    --     volume = 0.6
    --   },
    --   match_speed_to_activity = true,
    -- },
    min_perceived_performance = 0.25,
    performance_to_sound_speedup = 0.5
  },


  -- Entity: atomic pile
  -- Entity: nuclear reactor
  {
    type = "recipe",
    name = "nuclear fuel rods",
    category = "advanced-crafting",
    ingredients = {
      {"purified uranium",12}
    },
    results = "nuclear fuel rod",
  },
  {
    type = "recipe",
    name = "enriched fuel rods",
    category = "advanced-crafting",
    ingredients = {
      {"enriched uranium",8}
    },
    results = "nuclear fuel rod",
  },

  {
    type = "boiler",
    name = "atomic pile",
    icon = "__power-facilities__/graphics/icons/atomic pile.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = "atomic pile"},
    max_health = 100,
    corpse = "small-remnants",
    vehicle_impact_sound =  { filename = "__power-facilities__/sound/car-metal-impact.ogg", volume = 0.65 },
    resistances =
    {
      {
        type = "fire",
        percent = 80
      }
    },
    fast_replaceable_group = "pipe",
    collision_box = {{-2.5, -2.5}, {2.5, 2.5}},
    selection_box = {{-2.5, -2.5}, {2.5, 2.5}},
    fluid_box =
    {
      base_area = 1,
      pipe_covers = pipecoverspictures(),
      pipe_connections =
      {
        { position = {-1, -3} },
        { position = {0, -3} },
        { position = {1, -3} },
        { position = {-1, 3} },
        { position = {0, 3} },
        { position = {1, 3} },
        { position = {-3, -1} },
        { position = {-3, 0} },
        { position = {-3, 1} },
        { position = {3, -1} },
        { position = {3, 0} },
        { position = {3, 1} },
      },
    },
    energy_consumption = "390kW",
    burner =
    {
      effectivity = 0.8,
      fuel_inventory_size = 9,
      emissions = 0.1 / 6.5,
      -- smoke =
      -- {
      --   {
      --     name = "smoke",
      --     position = {0.0, -0.8},
      --     frequency = 5,
      --     starting_vertical_speed = 0.0,
      --     starting_frame_deviation = 60
      --   }
      -- }
    },
    -- working_sound =
    -- {
    --   sound =
    --   {
    --     filename = "__power-facilities__/sound/atomic pile.ogg",
    --     volume = 0.8
    --   },
    --   max_sounds_per_type = 3
    -- },
    structure =
    {
      -- left =
      -- {
      --   filename = "__power-facilities__/graphics/entity/atomic pile/atomic pile-left.png",
      --   priority = "extra-high",
      --   width = 46,
      --   height = 46,
      --   shift = {0.03125, 0}
      -- },
      down =
      {
        filename = "__power-facilities__/graphics/entity/atomic pile/atomic pile-down.png",
        priority = "extra-high",
        width = 66,
        height = 72 --, shift = {0.05, 0}
      },
      -- left_down =
      -- {
      --   filename = "__power-facilities__/graphics/entity/atomic pile/atomic pile-left-down.png",
      --   priority = "extra-high",
      --   width = 60,
      --   height = 50 --, shift = {0, -0.02}
      -- },
      -- right_down =
      -- {
      --   filename = "__power-facilities__/graphics/entity/atomic pile/atomic pile-right-down.png",
      --   priority = "extra-high",
      --   width = 44,
      --   height = 50
      -- },
      -- left_up =
      -- {
      --   filename = "__power-facilities__/graphics/entity/atomic pile/atomic pile-left-up.png",
      --   priority = "extra-high",
      --   width = 66,
      --   height = 74 --, shift = {0.05, 0}
      -- },
      -- right_up =
      -- {
      --   filename = "__power-facilities__/graphics/entity/atomic pile/atomic pile-right-up.png",
      --   priority = "extra-high",
      --   width = 46,
      --   height = 72 --, shift = {0.15, 0}
      -- },
      -- t_down =
      -- {
      --   filename = "__power-facilities__/graphics/entity/atomic pile/atomic pile-t-down.png",
      --   priority = "extra-high",
      --   width = 44,
      --   height = 50 --, shift = {0, 0}
      -- },
      -- t_up =
      -- {
      --   filename = "__power-facilities__/graphics/entity/atomic pile/atomic pile-t-up.png",
      --   priority = "extra-high",
      --   width = 46,
      --   height = 70 --, shift = {0, 0}
      -- }
    },
    -- fire =
    -- {
    --   left = boilerfires.down,
    --   down = boilerfires.left,
    --   left_down = boilerfires.right,
    --   right_down = boilerfires.left,
    --   left_up = boilerfires.down,
    --   right_up = boilerfires.down,
    --   t_up = boilerfires.down
    -- },
    burning_cooldown = 120,
    -- these are the pipe pictures - boiler is a pipe as well
    pictures = {

    }
  },
  {
    type = "boiler",
    name = "nuclear reactor",
    icon = "__power-facilities__/graphics/icons/nuclear reactor.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = "nuclear reactor"},
    max_health = 100,
    corpse = "small-remnants",
    vehicle_impact_sound =  { filename = "__power-facilities__/sound/car-metal-impact.ogg", volume = 0.65 },
    resistances =
    {
      {
        type = "fire",
        percent = 80
      }
    },
    fast_replaceable_group = "pipe",
    collision_box = {{-2.5, -2.5}, {2.5, 2.5}},
    selection_box = {{-2.5, -2.5}, {2.5, 2.5}},
    fluid_box =
    {
      base_area = 1,
      pipe_covers = pipecoverspictures(),
      pipe_connections =
      {
        { position = {-1, -3} },
        { position = {0, -3} },
        { position = {1, -3} },
        { position = {-1, 3} },
        { position = {0, 3} },
        { position = {1, 3} },
        { position = {-3, -1} },
        { position = {-3, 0} },
        { position = {-3, 1} },
        { position = {3, -1} },
        { position = {3, 0} },
        { position = {3, 1} },
      },
    },
    energy_consumption = "390kW",
    burner =
    {
      effectivity = 0.8,
      fuel_inventory_size = 9,
      emissions = 0.1 / 6.5,
      -- smoke =
      -- {
      --   {
      --     name = "smoke",
      --     position = {0.0, -0.8},
      --     frequency = 5,
      --     starting_vertical_speed = 0.0,
      --     starting_frame_deviation = 60
      --   }
      -- }
    },
    -- working_sound =
    -- {
    --   sound =
    --   {
    --     filename = "__power-facilities__/sound/nuclear reactor.ogg",
    --     volume = 0.8
    --   },
    --   max_sounds_per_type = 3
    -- },
    structure =
    {
      -- left =
      -- {
      --   filename = "__power-facilities__/graphics/entity/nuclear reactor/nuclear reactor-left.png",
      --   priority = "extra-high",
      --   width = 46,
      --   height = 46,
      --   shift = {0.03125, 0}
      -- },
      down =
      {
        filename = "__power-facilities__/graphics/entity/nuclear reactor/nuclear reactor-down.png",
        priority = "extra-high",
        width = 66,
        height = 72 --, shift = {0.05, 0}
      },
      -- left_down =
      -- {
      --   filename = "__power-facilities__/graphics/entity/nuclear reactor/nuclear reactor-left-down.png",
      --   priority = "extra-high",
      --   width = 60,
      --   height = 50 --, shift = {0, -0.02}
      -- },
      -- right_down =
      -- {
      --   filename = "__power-facilities__/graphics/entity/nuclear reactor/nuclear reactor-right-down.png",
      --   priority = "extra-high",
      --   width = 44,
      --   height = 50
      -- },
      -- left_up =
      -- {
      --   filename = "__power-facilities__/graphics/entity/nuclear reactor/nuclear reactor-left-up.png",
      --   priority = "extra-high",
      --   width = 66,
      --   height = 74 --, shift = {0.05, 0}
      -- },
      -- right_up =
      -- {
      --   filename = "__power-facilities__/graphics/entity/nuclear reactor/nuclear reactor-right-up.png",
      --   priority = "extra-high",
      --   width = 46,
      --   height = 72 --, shift = {0.15, 0}
      -- },
      -- t_down =
      -- {
      --   filename = "__power-facilities__/graphics/entity/nuclear reactor/nuclear reactor-t-down.png",
      --   priority = "extra-high",
      --   width = 44,
      --   height = 50 --, shift = {0, 0}
      -- },
      -- t_up =
      -- {
      --   filename = "__power-facilities__/graphics/entity/nuclear reactor/nuclear reactor-t-up.png",
      --   priority = "extra-high",
      --   width = 46,
      --   height = 70 --, shift = {0, 0}
      -- }
    },
    -- fire =
    -- {
    --   left = boilerfires.down,
    --   down = boilerfires.left,
    --   left_down = boilerfires.right,
    --   right_down = boilerfires.left,
    --   left_up = boilerfires.down,
    --   right_up = boilerfires.down,
    --   t_up = boilerfires.down
    -- },
    burning_cooldown = 120,
    -- these are the pipe pictures - boiler is a pipe as well
    pictures = {

    }
  },
  -- Entity: uranium mill
  {
    type = "item",
    name = "uranium mill",
    icon = "__power-facilities__/graphics/icons/uranium mill.png",
    flags = {"goes-to-quickbar"},
    subgroup = "advanced-processing-machine",
    order = "f",
    place_result = "uranium mill",
    stack_size = 50
  },
  {
    type = "recipe",
    name = "uranium mill",
    ingredients = {
      {"iron-plate",20},{"steel-plate",8},{"iron-gear-wheel",5}
    },
    result = "uranium mill"
  },
  {
    type = "uranium mill",
    name = "uranium mill",
    icon = "__power-facilities__/graphics/icons/uranium mill.png",
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {mining_time = 1, result = "uranium mill"},
    max_health = 150,
    corpse = "medium-remnants",
    repair_sound = { filename = "__base__/sound/manual-repair-simple.ogg" },
    mined_sound = { filename = "__base__/sound/deconstruct-bricks.ogg" },
    open_sound = { filename = "__base__/sound/machine-open.ogg", volume = 0.85 },
    close_sound = { filename = "__base__/sound/machine-close.ogg", volume = 0.75 },
    vehicle_impact_sound =  { filename = "__base__/sound/car-stone-impact.ogg", volume = 1.0 },
    -- working_sound =
    -- {
    --   sound = { filename = "__power-facilities__/sound/mill.ogg", }
    -- },
    resistances =
    {
      {
        type = "fire",
        percent = 80
      },
      {
        type = "explosion",
        percent = 30
      }
    },
    collision_box = {{-0.7, -0.7}, {0.7, 0.7}},
    selection_box = {{-0.8, -1}, {0.8, 1}},
    crafting_categories = {"smelting"},
    result_inventory_size = 1,
    energy_usage = "180kW",
    crafting_speed = 1,
    source_inventory_size = 1,
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-output"
    },
    animation =
    {
      filename = "__power-facilities__/graphics/entity/uranium mill/uranium mill.png",
      priority = "extra-high",
      width = 81,
      height = 64,
      frame_count = 1,
      shift = {0.5, 0.05 }
    },
    working_visualisations =
    {
      {
        north_position = {0.0, 0.0},
        east_position = {0.0, 0.0},
        south_position = {0.0, 0.0},
        west_position = {0.0, 0.0},
        animation =
        {
          filename = "__power-facilities__/graphics/entity/uranium mill/uranium mill-active.png",
          priority = "extra-high",
          width = 23,
          height = 27,
          frame_count = 12,
          shift = { 0.078125, 0.5234375}
        },
        light = {intensity = 1, size = 1}
      }
    },
    fast_replaceable_group = "mill"
  },
  {
    type = "recipe",
    name = "pulped uranium ore",
    category = "uranium mill",
    ingredients = {
      "uranium ore"
    },
    result = "pulped uranium ore",
  },
}
)
