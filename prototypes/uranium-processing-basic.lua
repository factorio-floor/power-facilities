
-- Basic:
-- Item: pulped-uranium-ore
-- Item: yellowcake (U₃O₈)
-- Item: purified-uranium (UO₂)

data:extend(
{
  {
    type = "item",
    name = "pulped-uranium-ore",
    icon = "__power-facilities__/graphics/icons/pulped-uranium-ore.png",
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
    type = "recipe",
    name = "yellowcake",
    category = "advanced-crafting", -- chemistry
    ingredients = {
      {type="fluid", name="sulfuric-acid", amount=4}, -- acid, alkaline, peroxide
      {name="pulped-uranium-ore", amount=10},
    },
    result = "yellowcake",
  },

  {
    type = "item",
    name = "purified-uranium",
    icon = "__power-facilities__/graphics/icons/purified-uranium.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "raw-material",
    order = "f-a[uranium-ore]",
    stack_size = 44
  },
  {
    type = "recipe",
    name = "purified-uranium",
    category = "smelting",
    ingredients = {
      {name="yellowcake",amount=22}
    },
    result = "purified-uranium"
  },

  -- Entity: uranium-mill
  {
    type = "recipe-category",
    name = "uranium-mill"
  },
  {
    type = "item",
    name = "uranium-mill",
    icon = "__power-facilities__/graphics/icons/uranium-mill.png",
    flags = {"goes-to-quickbar"},
    subgroup = "production-machine",
    order = "f",
    place_result = "uranium-mill",
    stack_size = 50
  },
  {
    type = "recipe",
    name = "uranium-mill",
    ingredients = {
      {"iron-plate",20},{"steel-plate",8},{"iron-gear-wheel",5}
    },
    result = "uranium-mill"
  },
{
    type = "furnace",
    name = "uranium-mill",
    icon = "__power-facilities__/graphics/icons/uranium-mill.png",
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {mining_time = 1, result = "uranium-mill"},
    max_health = 150,
    corpse = "medium-remnants",
    dying_explosion = "medium-explosion",
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
        percent = 35
      }
    },
    collision_box = {{-0.7, -0.7}, {0.7, 0.7}},
    selection_box = {{-0.8, -1}, {0.8, 1}},
    module_specification =
    {
      module_slots = 2,
      module_info_icon_shift = {0, 0.8}
    },
    allowed_effects = {"consumption", "speed", "pollution"},
    crafting_categories = {"uranium-mill"},
    result_inventory_size = 4,
    energy_usage = "278kW",
    crafting_speed = 1,
    source_inventory_size = 1,
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input"
    },
    animation =
    {
      filename = "__power-facilities__/graphics/entity/uranium-mill/uranium-mill.png",
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
          filename = "__power-facilities__/graphics/entity/uranium-mill/uranium-mill-active.png",
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
    name = "pulped-uranium-ore",
    category = "uranium-mill",
    ingredients = {
      {name="uranium-ore",ammount=1}
    },
    result = "pulped-uranium-ore",
  },
}
)
