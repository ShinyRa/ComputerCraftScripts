local screen = peripheral.wrap("top")

local logo = paintutils.loadImage("images/logo.nfp")
local logo2 = paintutils.loadImage("images/logo2.nfp")
local punch = paintutils.loadImage("images/punch.nfp")

local switch = true
-- Redirect all terminal traffic to screen
term.redirect(screen)

function resetColours()
    term.setBackgroundColour(colours.black)
    term.setTextColor(colours.white)
end

print("Booting Gaia")
print("Type: Computer")
print("Prerequisites:")

print("Images folder")
assert(fs.isDir("images/"), "Prerequisite image folder not found on disk")
print("Check")

print("Wireless modem peripheral mounted to slot right")
assert(peripheral.isPresent("right"), "No peripheral found on side 'right'")
assert(peripheral.getType("right") == "modem", "Prerequisite modem not found on side 'right'")
print("Check")

print("Speaker peripheral mounted to slot left")
assert(peripheral.isPresent("left", "No peripheral found on side 'left'"))
assert(peripheral.getType("left") == "speaker", "Prerequisite speaker not found on side 'left'")
print("Check")

local speaker = peripheral.wrap("left")
rednet.open("right")

while true do
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
    
    term.setTextColour(colours.white)
    term.setCursorPos(1, 8)
    term.write("#######################################")

    term.setCursorPos(5, 10)
    paintutils.drawImage(punch, term.getCursorPos())
    resetColours()
    
    term.setCursorPos(3, 18)
    term.setTextColour(colours.red)
    term.write("Fruit punch")
    resetColours()

    term.setCursorPos(18, 10)
    ter.write("Free of charge!")
    
    paintutils.drawFilledBox(18, 14, 35, 16, colours.yellow)
    resetColours()
    term.setCursorPos(22, 15)
    term.setTextColour(colours.black)
    term.setBackgroundColour(colours.yellow)
    term.write("order x64")
    resetColours()

    term.setCursorPos(19, 10)

    local event = os.pullEvent()
    if event == "monitor_touch" then
        speaker.playSound("ui.button.click")
        rednet.broadcast({}, "hesperides_order_punch")
    end

    sleep(2)
end