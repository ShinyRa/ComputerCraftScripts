print("Booting Hercules")
print("Hercules prerequisites:")
print("1 juicer in inventory")

local TOTAL_SLOTS = 16
local JuicerItemTag = "pamhc2foodcore:juiceritem"
local ObsidianChestTag = "expendedstorage:obsidian_chest"

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

assert(findInPocket(JuicerItemTag), "Required juicer not found in Hercules' inventory")

while turtle.inspect().name ~= ObsidianChestTag do
    print("Not an obsidian chest")
    local success, data = turtle.inspect()
    print(textutils.serialise(data))
    
    if success then
        turtle.turnRight() 
    end
    if not success then 
        turtle.forward()
    end
end