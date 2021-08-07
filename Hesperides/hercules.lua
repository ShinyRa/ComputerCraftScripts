print("Booting Hercules")
print("Hercules prerequisites:")
print("1 juicer in inventory")

local TOTAL_SLOTS = 16

local juicerItemTag = "pamhc2foodcore:juiceritem"
local obsidianChestTag = "expandedstorage:obsidian_chest"
local regularChestTag = "minecraft:chest"

-- Helper function
-- Find item in inventory
function findInPocket(toFind)
    for slot = 1, TOTAL_SLOTS, 1 do
        if turtle.getItemCount(slot) > 0 then
            local item = turtle.getItemDetail(slot) 
            if item.name == toFind then
                return true
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
            
            turtle.turnRight() 
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
function craftJuice()
    assert(findInPocket(juicerItemTag), "Required juicer not found in Hercules' inventory")
    findMelonChest()
    turtle.select(2)
    turtle.suck()
end

craftJuice()
-- while true do
    

-- end


