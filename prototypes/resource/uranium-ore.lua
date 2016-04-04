
data:extend(
{
  {
    type = "autoplace-control",
    name = "uranium-ore",
    richness = true,
    order = "b-f-t"
  },
  {
    type = "noise-layer",
    name = "uranium-ore"
  },
  {
    type = "item",
    name = "uranium-ore",
    icon = "__power-facilities__/graphics/icons/uranium-ore.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "raw-resource",
    order = "f-a[uranium-ore]",
    stack_size = 40
  },

  {
    type = "resource",
    name = "uranium-ore",
    icon = "__power-facilities__/graphics/icons/uranium-ore.png",
    flags = {"placeable-neutral"},
    order="a-b-a",
    minable =
    {
      hardness = 0.7,
      -- mining_particle = "uranium-ore-particle",
      mining_time = 1,
      result = "uranium-ore"
    },
    collision_box = {{ -0.1, -0.1}, {0.1, 0.1}},
    selection_box = {{ -0.5, -0.5}, {0.5, 0.5}},
    autoplace =
    {
      control = "uranium-ore",
      sharpness = 1,
      richness_multiplier = 1000,
      richness_base = 140,
      size_control_multiplier = 0.05,
      peaks = {
        {
          influence = 0.2,
          starting_area_weight_optimal = 0,
          starting_area_weight_range = 0,
          starting_area_weight_max_range = 2,
        },
        {
          influence = 0.65,
          noise_layer = "uranium-ore",
          noise_octaves_difference = -1.9,
          noise_persistence = 0.3,
          starting_area_weight_optimal = 0,
          starting_area_weight_range = 0,
          starting_area_weight_max_range = 2,
        },
        {
          influence = 0.3,
          starting_area_weight_optimal = 1,
          starting_area_weight_range = 0,
          starting_area_weight_max_range = 2,
        },
        {
          influence = 0.55,
          noise_layer = "uranium-ore",
          noise_octaves_difference = -2.3,
          noise_persistence = 0.4,
          starting_area_weight_optimal = 1,
          starting_area_weight_range = 0,
          starting_area_weight_max_range = 2,
        },
        {
          influence = -0.2,
          max_influence = 0,
          noise_layer = "iron-ore",
          noise_octaves_difference = -2.3,
          noise_persistence = 0.45,
        },
        {
          influence = -0.2,
          max_influence = 0,
          noise_layer = "coal",
          noise_octaves_difference = -2.3,
          noise_persistence = 0.45,
        },
        {
          influence = -0.2,
          max_influence = 0,
          noise_layer = "copper-ore",
          noise_octaves_difference = -2.3,
          noise_persistence = 0.45,
        },
        {
          influence = -0.2,
          max_influence = 0,
          noise_layer = "stone",
          noise_octaves_difference = -3,
          noise_persistence = 0.45,
        },
      },
    },
    stage_counts = {1000, 600, 400, 200, 100, 50, 20, 1},
    stages =
    {
      sheet =
      {
        filename = "__power-facilities__/graphics/entity/uranium-ore/uranium-ore.png",
        priority = "extra-high",
        width = 38,
        height = 38,
        frame_count = 4,
        variation_count = 8
      }
    },
    map_color = {r=0.000, g=0.580, b=0.000}
  },
}
)
