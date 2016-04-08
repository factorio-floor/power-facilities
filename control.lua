require "defines"
require "control.cooling-tower"

local cooling_tower_entities = {}
local offshore_drain_entities = {}

-- on_tick
script.on_event(defines.events.on_tick, function(event)
    for idx, cooling_tower_entity in pairs(cooling_tower_entities) do
        if not cooling_tower_entity.valid then
            -- cleanup deleted things
            cooling_tower_entities[idx] = nil
        else
            if cooling_tower_entity and cooling_tower_entity.fluidbox and cooling_tower_entity.fluidbox[1] then
                current = cooling_tower_entity.fluidbox[1]                       -- store current liquid
                current.temperature = current.temperature - (current.amount / 10)
                if current.temperature < 15 then
                    current.temperature = 15
                end
                cooling_tower_entity.fluidbox[1] = current                       -- update entity liquid
            end
        end
    end
    for idx, offshore_drain_entity in pairs(offshore_drain_entities) do
        if not offshore_drain_entity.valid then
            -- cleanup deleted things
            offshore_drain_entities[idx] = nil
        else
            if offshore_drain_entity and offshore_drain_entity.fluidbox and offshore_drain_entity.fluidbox[1] then
                current = offshore_drain_entity.fluidbox[1]                       -- store current liquid
                current.amount = current.amount - 10                              -- change current temperature
                if current.amount < 0 then
                    current.amount = 0
                end
                offshore_drain_entity.fluidbox[1] = current                       -- update entity liquid

                if current.temperature > 25 then
                    game.get_surface(1).pollute(offshore_drain_entity.position, (current.temperature - 25) * current.amount / 10)
                end
            end
        end
    end
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
end
script.on_init(on_init)
script.on_load(on_init)

function on_built_entity(event)
    if 'cooling-tower' == event.created_entity.name then
        table.insert(cooling_tower_entities, event.created_entity)
    end
    if 'offshore-drain' == event.created_entity.name then
        table.insert(offshore_drain_entities, event.created_entity)
    end
end
script.on_event(defines.events.on_built_entity, on_built_entity)
script.on_event(defines.events.on_robot_built_entity, on_built_entity)
