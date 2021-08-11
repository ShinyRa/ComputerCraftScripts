local pretty = require("cc.pretty")
local repository = "https://raw.githubusercontent.com/ShinyRa/ComputerCraftScripts/main/"

local installationTree = {
    ["Herperides"] = {
        info = "Farm bots",
        children = {
            ["Apollo"] = {
                info = "Music terminal",
                type = "Computer",
                peripherals = "[♬, ⌧*]",
                files = {
                    "Herperides/apollo.lua"
                }
            },
            ["Ares"] = {
                info = "XP bot",
                type = "Turtle (⚔)",
                peripherals = "[]",
                files = {
                    "Herperides/ares.lua"
                }
            },
            ["Gaia"] = {
                info = "Drink ordering terminal",
                type = "Computer",
                peripherals = "[♬, ⛀, ⌧]",
                files = {
                    "Herperides/gaia.lua",
                    "Herperides/images/logo.nfp",
                    "Herperides/images/logo2.nfp",
                    "Herperides/images/punch.nfp"
                }
            },
            ["Hercules"] = {
                info = "Music bot",
                type = "Computer",
                peripherals = "[⛀]",
                files = {
                    "Herperides/hercules.lua"
                }
            }
        }
    },
    ["Yggdrasil"] = {
        info = "Woodcutting bots",
        children = {
            ["Thor"] = {
                info = "Tree cutting bot",
                type = "Turtle 🪓",
                peripherals = "[⛀]",
                files = {
                    "Yggdrasil/thor.lua"
                }
            }
        }
    }
}

local selectedBotIndex = 1

local function installSelected()
    shell.run("set motd.enabled false")
    fs.delete("startup.lua")
    fs.delete("pulled/")
    fs.makeDir("pulled")
    shell.setDir("pulled/")

    local bot = getBotByIndex(selectedBotIndex)

    for file in bot.files do
        shell.run("wget " .. repository .. file)
    end

    shell.run("cp " .. bot.files[1] .. " ../startup.lua")

    shell.setDir("/")
    fs.delete("installer.lua")
    shell.run("reboot")
end

local function getBotByIndex(index)
    local botIndex = 1

    for folder, entry in pairs(installationTree) do
        for name, programme in pairs(entry.children) do
            if botIndex == index then
                return programme
            end

            botIndex = botIndex + 1
        end
    end
end

local function getAmountOfBots()
    local numberOfBots = 0
    for folder, entry in pairs(installationTree) do
        for name, programme in pairs(entry.children) do
            numberOfBots = numberOfBots + 1 
        end
    end
    return numberOfBots
end

while true do
    term.clear()
    term.setCursorPos(1, 1)
    
    local currentBotIndex = 1
    for folder, entry in pairs(installationTree) do
        print(folder .. "/" .. " (" .. entry.info .. ")")
        for name, programme in pairs(entry.children) do
            if currentBotIndex == selectedBotIndex then
                write(">> ")
            end
            print(pretty.nest(3, pretty.text("  " .. name .. " (" .. programme.info .. ") " .. programme.peripherals)))

            currentBotIndex = currentBotIndex + 1
        end
    end

    local event, key = os.pullEvent("key")

    if (
        keys.getName(key) == "up" and
        selectedBotIndex >= 1
    ) then
        selectedBotIndex = selectedBotIndex - 1
    end

    if (
        keys.getName(key) == "down" and
        selectedBotIndex <= getAmountOfBots()
    ) then
        selectedBotIndex = selectedBotIndex + 1
    end

    if (keys.getName(key) == "enter") then
        installSelected()
    end
end


-- local label = os.getComputerLabel()
-- if label then
--     print("Running installer for: " .. label)
-- else
--     print("Running installer for: " .. os.getComputerID())
-- end



-- if string.lower(label) == "gaia" then
--     print("Installation for Gaia")
--     print("Downloading files")
--     shell.run("wget https://raw.githubusercontent.com/ShinyRa/ComputerCraftScripts/main/Hesperides/Gaia/gaia.lua")
--     shell.run("cp gaia.lua ../startup.lua")

--     -- Create additional images directory with logos
--     shell.setDir("/")
--     fs.makeDir("images")
--     shell.setDir("images/")
--     shell.run("wget https://raw.githubusercontent.com/ShinyRa/ComputerCraftScripts/main/Hesperides/Gaia/images/logo.nfp")
--     shell.run("wget https://raw.githubusercontent.com/ShinyRa/ComputerCraftScripts/main/Hesperides/Gaia/images/logo2.nfp")
--     shell.run("wget https://raw.githubusercontent.com/ShinyRa/ComputerCraftScripts/main/Hesperides/Gaia/images/punch.nfp")
-- elseif string.lower(label) == "hercules" then
--     print("Installation for Hercules")
--     print("Downloading files")
--     shell.run("wget https://raw.githubusercontent.com/ShinyRa/ComputerCraftScripts/main/Hesperides/Hercules/hercules.lua")
--     shell.run("cp hercules.lua ../startup.lua")
-- elseif string.lower(label) == "apollo" then
--     print("Installation for Apollo")
--     print("Downloading files")
--     shell.run("wget https://raw.githubusercontent.com/ShinyRa/ComputerCraftScripts/main/Hesperides/Apollo/apollo.lua")
--     shell.run("cp apollo.lua ../startup.lua")
-- elseif string.lower(label) == "ares" then
--     print("Installation for Ares")
--     print("Downloading files")
--     shell.run("wget https://raw.githubusercontent.com/ShinyRa/ComputerCraftScripts/main/Hesperides/Ares/ares.lua")
--     shell.run("cp ares.lua ../startup.lua")
-- end

-- shell.setDir("/")
-- fs.delete("installer.lua")
-- shell.run("reboot")
