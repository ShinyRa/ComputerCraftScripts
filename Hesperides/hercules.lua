print("Booting Hercules")
print("Type: Turtle")
print("Prerequisites:")
print("1 juicer in inventory (preferably first inventory slot)")

-- Total inventory slots available to the turtle
local TOTAL_SLOTS = 16
-- Slots to populate when crafting fruit punch
local JUICE_CRAFTING_SLOTS = {2, 5, 6}

local juicerItemTag = "pamhc2foodcore:juiceritem"
local fruitPunchItemTag = "pamhc2foodcore:fruitpunchitem"
local obsidianChestTag = "expandedstorage:obsidian_chest"
local regularChestTag = "minecraft:chest"

-- Helper function
-- Find item in inventory
function findInPocket(toFind)
    for slot = 1, TOTAL_SLOTS, 1 do
        if turtle.getItemCount(slot) > 0 then
            local item = turtle.getItemDetail(slot)
            turtle.select(slot)
            if item.name == toFind then
                turtle.transferTo(1)
                return turtle.getSelectedSlot()
            end
        end
    end

    return false
end

-- Helper function
-- Walk to block tag
function walkTo(blockTag)
    local found

    while not found do
        local success, data = turtle.inspect()
        
        if success then
            if data.name == blockTag then
                found = true
                break;
            end
            
            turtle.turnLeft() 
        end
        if not success then
            turtle.forward()
        end
        
        sleep(1)
    end
end

function findMelonChest()
    walkTo(obsidianChestTag)
end

function findJuiceChest()
    walkTo(obsidianChestTag)
end

function findOutputChest()
    walkTo(regularChestTag)
end

-- Helper function craft item
function craftPunch()
    assert(findInPocket(juicerItemTag) > 0, "Required juicer not found in Hercules' inventory")
    findMelonChest()

    -- Loop through the crafting slots to meet fruit punch crafting recipe
    for slot = 1, #JUICE_CRAFTING_SLOTS do
        turtle.select(JUICE_CRAFTING_SLOTS[slot])
        -- Suck stack of melons
        turtle.suck()
    end

    turtle.craft()
end

function depositJuice()
    local fruitJuiceSlot = findInPocket(fruitPunchItemTag)
    if fruitJuiceSlot > 0 then
        findJuiceChest()
        turtle.select(fruitJuiceSlot)
        turtle.dropDown()
    end 
end

craftPunch()
depositJuice()

