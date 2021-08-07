print("Removing junk")
fs.delete("pulled/")
fs.makeDir("pulled")
shell.setDir("pulled/")
local label = os.getComputerLabel()

if string.lower(label) == "gaia" then
    print("Installation for Gaia")
    print("Downloading files")
    shell.run("hercules")
    shell.run("wget https://raw.githubusercontent.com/ShinyRa/ComputerCraftScripts/main/Hesperides/gaia.lua")
    shell.run("cp gaia ../rom/autorun/startup.lua")
elseif string.lower(label) == "hercules" then
    print("Installation for Hercules")
    print("Downloading files")
    shell.run("wget https://raw.githubusercontent.com/ShinyRa/ComputerCraftScripts/main/Hesperides/hercules.lua")
    shell.run("cp hercules ../rom/autorun/startup.lua")
end

shell.setDir("../")
fs.delete("installer.lua")
shell.run("reboot")
