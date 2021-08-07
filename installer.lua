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
    shell.run("cp gaia ../rom/startup/autorun.lua")
    shell.run("gaia")
elseif string.lower(label) == "hercules" then
    print("Installation for Hercules")
    print("Downloading files")
    shell.run("wget https://raw.githubusercontent.com/ShinyRa/ComputerCraftScripts/main/Hesperides/hercules.lua")
    shell.run("cp hercules ../rom/startup/autorun.lua")
    shell.run("hercules")
end

fs.delete("installer.lua")
