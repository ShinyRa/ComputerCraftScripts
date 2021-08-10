shell.run("set motd.enabled false")
print("Removing junk")
fs.delete("startup.lua")
fs.delete("pulled/")
fs.makeDir("pulled")
--hello
shell.setDir("pulled/")
local label = os.getComputerLabel()

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
end

shell.setDir("/")
fs.delete("installer.lua")
shell.run("reboot")
