print("Booting Gaia")
print("Type: Turtle")
print("Prerequisites:")
print("2 Logo animation pictures")


local screen = peripheral.wrap("top")

local logo = paintutils.loadImage("images/logo.nfp")
local logo2 = paintutils.loadImage("images/logo2.nfp")

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

    term.setCursorPos(4, 4)
    term.write("Danny & Tijs'")

    term.setTextColour(colours.pink)
    term.setCursorPos(5, 5)
    textutils.slowPrint("sompige sapjes")
    
    -- Button
    paintutils.drawBox(7, 15, 10, 15, colours.yellow)

    resetColours()
    sleep(2)
end