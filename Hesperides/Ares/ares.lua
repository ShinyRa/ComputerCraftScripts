local TOTAL_SLOTS = 16
function hasItems()
    local totalItems = 0

    for slot = 1, TOTAL_SLOTS, 1 do
        turtle.select(slot)
        if turtle.getItemCount() > 0 then
            totalItems = totalItems + turtle.getItemCount()
        end
    end

    return totalItems
end

while true do
    local success, data = turtle.inspect()

    if data.state.powered then
        turtle.attack()
        turtle.suck()
    else
        if hasItems() > 0 then
            turtle.turnRight()
            for slot = 1, TOTAL_SLOTS, 1 do
                turtle.select(slot)
                turtle.drop()
            end
            turtle.turnLeft()
        end
    end

    sleep(0.08)
end