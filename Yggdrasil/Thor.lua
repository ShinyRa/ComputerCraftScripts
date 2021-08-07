print("Booting Thor")
print("Type: Turtle")
print("Prerequisites:")
print("Modem peripheral mounted to slot right")

local modem = peripheral.wrap("right")

local function foundWood(block)
    return block == "minecraft:spruce_log"
end

while turtle.inspect() do
    -- find block turtle's facing
    local success, data = turtle.inspect()

    if (foundWood(data.name)) then
        loopThroughTree()
    end

    sleep(5)
end