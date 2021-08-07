print("Booting Hercules")
print("Hercules prerequisites:")
print("1 juicer in inventory")

local TOTAL_SLOTS = 16

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

assert(findInPocket("pamhc2foodcord:juiceritem"), "Required juicer not found in Hercules' inventory")
