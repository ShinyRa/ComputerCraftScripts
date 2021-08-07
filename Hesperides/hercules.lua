print("Booting Hercules")
print("Hercules prerequisites:")
print("1 juicer in inventory")

local TOTAL_SLOTS = 16

function findInPocket (toFind)
    local found = false
    for slot = 1, TOTAL_SLOTS, 1 do
        if turtle.getItemCount(slot) > 0 do
            local item = turtle.getItemDetail(slot) 
            found = item.name == toFind
        end

        if found then 
            break
        end
    end
end

assert(findInPocket("pamhc2foodcord:juiceritem"))
