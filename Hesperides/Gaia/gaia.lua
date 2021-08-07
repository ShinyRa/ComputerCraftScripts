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
    
    term.setCursorPos(5, 10)
    paintutils.drawImage(punch, term.getCursorPos())
    resetColours()
    
    term.setCursorPos(5, 18)
    term.setTextColour(colours.red)
    term.write("Fruit punch")

    local event = os.pullEvent()
    if event == "monitor_touch" then

    end
    -- paintutils.drawBox(7, 15, 10, 15, colours.yellow)

    resetColours()
    sleep(5)
end

print("Booting Gaia")
print("Type: Computer")
print("Prerequisites:")

print("2 Logo animation pictures")
assert(fs.isDir("images/"), "Prerequisite image folder not found on disk")
print("Check")

print("Wireless modem peripheral mounted to slot right")
assert(peripheral.isPresent("right"), "No peripheral found on side 'right'")
assert(peripheral.getType("right"), "Prerequisite modem not found on side 'right'")
print("Check")