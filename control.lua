require "defines"
require "control.cooling-tower"

function has_value (tab, val)
    for index, value in ipairs (tab) do
        if value == val then
            return true
        end
    end

    return false
end

print('------------------------------------------------------------------')

-- debug
-- local pprint = require "lib.pprint-lua.pprint"
local inspect = require 'lib.inspect-lua.inspect'

local cooling_tower = {
    tick = 0,
    entities = {}
}

script.on_event(defines.events.on_tick, function(event)
    -- cooling_tower.tick = cooling_tower.tick + 1
    -- if cooling_tower.tick == 2 then
    --     cooling_tower.tick = 0

        for _, cooling_tower_entity in pairs(cooling_tower.entities) do
            if cooling_tower_entity and cooling_tower_entity.fluidbox and cooling_tower_entity.fluidbox[1] then
                if cooling_tower_entity.fluidbox[1].temperature > 25 then
                    cooling_tower_entity.fluidbox[1].temperature = cooling_tower_entity.fluidbox[1].temperature - 10
                end
            end
        end
    -- end
end)

-- register entities
function on_init(event)
    -- local ents = game.get_surface(1).find_entities_filtered{
    --     area={{-math.huge, -math.huge}, {math.huge, math.huge}},
    --     type="storage-tank",
    --     name="cooling-tower"
    -- }
    -- for _, cooling_tower_entity in ipairs(ents) do
    --     print(cooling_tower_entity)
    -- end
    -- print(
    --     inspect(
            -- game.find_entities_filtered{area = {{-math.huge, -math.huge}, {math.huge, math.huge}}, force= "player"}
    --     )
    -- )
end
script.on_init(on_init)
script.on_load(on_init)

function toggle_entity(event)
    -- print(inspect(event.created_entity))
    -- print(event.created_entity.name)
    if 'cooling-tower' == event.created_entity.name then
        if has_value(cooling_tower.entities, event.created_entity.position) then
            cooling_tower.entities[event.created_entity.position] = nil
        else
            cooling_tower.entities[event.created_entity.position] = event.created_entity
        end
    end
end
script.on_event(defines.events.on_built_entity, toggle_entity)
script.on_event(defines.events.on_robot_built_entity, toggle_entity)
script.on_event(defines.events.on_entity_died, toggle_entity)
