
data:extend(
{
  {
    type = "item",
    name = "electric-dynamo",
    icon = "__power-facilities__/graphics/icons/electric-dynamo.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "intermediate-product",
    order = "f-a[electric-dynamo]",
    stack_size = 1
  },
  {
    type = "recipe",
    name = "electric-dynamo",
    category = "crafting",
    ingredients = {
      {name="iron-gear-wheel",amount=12},
      {name="iron-plate",amount=16},
      {name="copper-cable",amount=80},
    },
    result = "electric-dynamo",
  },

  {
    type = "item",
    name = "electric-alternator",
    icon = "__power-facilities__/graphics/icons/electric-alternator.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "intermediate-product",
    order = "f-a[electric-alternator]",
    stack_size = 1
  },
  {
    type = "recipe",
    name = "electric-alternator",
    category = "crafting",
    ingredients = {
      {name="iron-gear-wheel",amount=4},
      {name="iron-plate",amount=36},
      {name="copper-cable",amount=200},
      {name="electronic-circuit",amount=12},
    },
    result = "electric-alternator",
  },
}
)
