local TOTAL_SLOTS = 16
-- test
function hasItems()
    local totalItems = 0

    for slot = 1, TOTAL_SLOTS, 1 do
        turtle.select(slot)
        totalItems = totalItems + turtle.getItemDetail()
    end

    return totalItems
end

while true do
    local success, data = turtle.inspect()

    if data.state.powered then
        turtle.attack()
        turtle.suck()
    else
        if hasItems > 0 then
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