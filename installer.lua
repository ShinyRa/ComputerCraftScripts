local url = "https://raw.githubusercontent.com/ShinyRa/ComputerCraftScripts/main"

local installationTree = {
    ["Herperides"] = {
        info = "Farm bots",
        children = {
            ["Apollo"] = {
                info = "Music terminal",
                type = "Computer",
                peripherals = "[♬, ⌧*]",
                files = {
                    "apollo.lua"
                }
            },
            ["Ares"] = {
                info = "XP bot",
                type = "Turtle (⚔)",
                peripherals = "[]",
                files = {
                    "ares.lua"
                }
            },
            ["Gaia"] = {
                info = "Drink ordering terminal",
                type = "Computer",
                peripherals = "[♬, ⛀, ⌧]",
                files = {
                    "gaia.lua",
                    "images/logo.nfp",
                    "images/logo2.nfp",
                    "images/punch.nfp"
                }
            },
            ["Hercules"] = {
                info = "Music bot",
                type = "Computer",
                peripherals = "[⛀]",
                files = {
                    "hercules.lua"
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
                    "thor.lua"
                }
            }
        }
    }
}

for folder, entry in pairs(installationTree) do
    print(folder .. "/" .. " (" .. entry.info .. ")")
    for name, programme in pairs(entry.children) do
        print("  " .. name .. " (" .. programme.info .. ") " .. programme.peripherals)
    end
end

term.clear()

local label = os.getComputerLabel()
if label then
    print("Running installer for: " .. label)
else
    print("Running installer for: " .. os.getComputerID())
end

shell.run("set motd.enabled false")
print("Removing junk")
fs.delete("startup.lua")
fs.delete("pulled/")
shell.setDir("pulled/")
fs.makeDir("pulled")

if string.lower(label) == "gaia" then
    print("Installation for Gaia")
    print("Downloading files")
    shell.run("wget https://raw.githubusercontent.com/ShinyRa/ComputerCraftScripts/main/Hesperides/Gaia/gaia.lua")
    shell.run("cp gaia.lua ../startup.lua")

    -- Create additional images directory with logos
    shell.setDir("/")
    fs.makeDir("images")
    shell.setDir("images/")
    shell.run("wget https://raw.githubusercontent.com/ShinyRa/ComputerCraftScripts/main/Hesperides/Gaia/images/logo.nfp")
    shell.run("wget https://raw.githubusercontent.com/ShinyRa/ComputerCraftScripts/main/Hesperides/Gaia/images/logo2.nfp")
    shell.run("wget https://raw.githubusercontent.com/ShinyRa/ComputerCraftScripts/main/Hesperides/Gaia/images/punch.nfp")
elseif string.lower(label) == "hercules" then
    print("Installation for Hercules")
    print("Downloading files")
    shell.run("wget https://raw.githubusercontent.com/ShinyRa/ComputerCraftScripts/main/Hesperides/Hercules/hercules.lua")
    shell.run("cp hercules.lua ../startup.lua")
elseif string.lower(label) == "apollo" then
    print("Installation for Apollo")
    print("Downloading files")
    shell.run("wget https://raw.githubusercontent.com/ShinyRa/ComputerCraftScripts/main/Hesperides/Apollo/apollo.lua")
    shell.run("cp apollo.lua ../startup.lua")
elseif string.lower(label) == "ares" then
    print("Installation for Ares")
    print("Downloading files")
    shell.run("wget https://raw.githubusercontent.com/ShinyRa/ComputerCraftScripts/main/Hesperides/Ares/ares.lua")
    shell.run("cp ares.lua ../startup.lua")
end

shell.setDir("/")
fs.delete("installer.lua")
shell.run("reboot")
