
data:extend(
{
  {
    type = "item",
    name = "uranium-fuel-rod-purified",
    icon = "__power-facilities__/graphics/icons/uranium-fuel-rod-purified.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "intermediate-product",
    order = "f-a[uranium-fuel-rod-purified]",
    stack_size = 1
  },
  {
    type = "recipe",
    name = "uranium-fuel-rod-purified",
    category = "advanced-crafting",
    ingredients = {
      {name="purified-uranium",amount=12},
      {name="plastic-bar",amount=8},
    },
    result = "uranium-fuel-rod-purified",
  },
}
)
