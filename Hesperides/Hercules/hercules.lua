print("Booting Hercules")
print("Type: Turtle")

-- Total inventory slots available to the turtle
local TOTAL_SLOTS = 16
-- Slots to populate when crafting fruit punch
local PUNCH_CRAFTING_SLOTS = {2, 5, 6}

local Tags = {
    juicerItem    = "pamhc2foodcore:juiceritem",
    fruitPunch    = "pamhc2foodcore:fruitpunchitem",
    obsidianChest = "expandedstorage:obsidian_chest",
    regularChest  = "minecraft:chest",
}

print("Prerequisites:")

print("1 juicer in inventory (preferably first inventory slot)")
assert(findInPocket(Tags.juicerItem) > 0, "Required juicer not found in Hercules' inventory")
print("Check")

print("Wireless modem peripheral mounted to slot right")
assert(peripheral.isPresent("right"), "No peripheral found on side 'right'")
assert(peripheral.getType("right"), "Prerequisite modem not found on side 'right'")
print("Check")


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

    return -1
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
    walkTo(Tags.obsidianChest)
end

function findJuiceChest()
    walkTo(Tags.obsidianChest)
end

function findOutputChest()
    walkTo(Tags.regularChest)
end

function canCraftPunch()
    local craftable = true
     for slot = 1, #PUNCH_CRAFTING_SLOTS do
        turtle.select(PUNCH_CRAFTING_SLOTS[slot])
        if turtle.getItemCount() == 0 then
            craftable = false
        end
    end

    return craftable
end

-- Helper function craft fruit punch
function craftPunch()
    assert(findInPocket(Tags.juicerItem) > 0, "Required juicer not found in Hercules' inventory")
    findMelonChest()

    while not canCraftPunch() do
        print("Can't craft punch :(")
        -- Loop through the crafting slots to meet fruit punch crafting recipe
        for slot = 1, #PUNCH_CRAFTING_SLOTS do
            turtle.select(PUNCH_CRAFTING_SLOTS[slot])
            -- Suck stack of melons
            turtle.suck(1)
        end
        
        sleep(5)
    end
    
    
    print("Can craft punch!")
    turtle.craft()
end

-- Helper function deposit fruit punch
function depositPunch()
    local fruitPunchSlot = findInPocket(Tags.fruitPunch)
    if fruitPunchSlot > 0 then
        findJuiceChest()
        turtle.select(fruitPunchSlot)
        turtle.dropDown()
    end 
end

craftPunch()
depositPunch()

