local screen = peripheral.wrap("top")

local logo = paintutils.loadImage("images/logo.nfp")
local logo2 = paintutils.loadImage("images/logo2.nfp")
local punch = paintutils.loadImage("images/punch.nfp")

local switch = true
-- local punchStock = 0
-- Redirect all terminal traffic to screen
term.redirect(screen)

function resetColours()
    term.setBackgroundColour(colours.black)
    term.setTextColor(colours.white)
end

print("Booting Gaia")
print("Type: Computer")
print("Prerequisites:")

print("2 Logo animation pictures")
assert(fs.isDir("images/"), "Prerequisite image folder not found on disk")
print("Check")

print("Wireless modem peripheral mounted to slot right")
assert(peripheral.isPresent("right"), "No peripheral found on side 'right'")
assert(peripheral.getType("right") == "modem", "Prerequisite modem not found on side 'right'")
print("Check")

rednet.open("right")

while true do
    -- local senderId, message, protocol = rednet.receive("hesperides_stock_adjust_punch", 5)
    -- if message then
    --     punchStock = punchStock + 1
    -- end

    term.clear()
    term.setCursorPos(1, 1)
    
    switch = not switch
    paintutils.drawImage(switch and logo or logo2, term.getCursorPos())
    
    -- Reset colours
    resetColours()
    
    term.setCursorPos(3, 4)
    term.write("Danny & Tijs'")
    
    term.setTextColour(colours.pink)
    term.setCursorPos(4, 5)
    term.write("sompige sapjes")
    
    term.setCursorPos(5, 9)
    paintutils.drawImage(punch, term.getCursorPos())
    resetColours()
    
    term.setCursorPos(3, 17)
    term.setTextColour(colours.red)
    term.write("Fruit punch")
    resetColours()

    paintutils.drawBox(15, 15, 25, 20, colours.yellow)
    term.setCursorPos(16, 16)
    term.write("Order x64")

    local event = os.pullEvent()
    if event == "monitor_touch" then
        broadcast.send({}, "hesperides_order_punch")
    end

    sleep(5)
end