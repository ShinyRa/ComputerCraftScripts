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

local chestFound

while not chestFound do
    local success, data = turtle.inspect()
    
    if success then
        print(textutils.serialise(data))
        if data.name == ObsidianChestTag then
            print("Found obisidian chest")
            chestFound = true
            break;
        end
        
        print("Not an obsidian chest. Turning")
        turtle.turnRight() 
    end
    if not success then
        print("Nothing found... moving on")
        turtle.forward()
    end
    
    sleep(1)
end