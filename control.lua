require "defines"
require "control.cooling-tower"

script.on_event(defines.events.on_tick, function(event)
  if game.tick % 50 ~= 0 then return end
  print('ding')
  -- updateBeltSorter(event)
  -- updateIncinerators()
  -- printOldMigrationNote()
  --printMissingRecipeLocalization()
end)
