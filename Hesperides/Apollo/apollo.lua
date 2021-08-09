local songs = {
    { tag = "minecraft:music_disc_13", name = "C418 - 13"},
    { tag = "minecraft:music_disc_cat", name = "C418 - cat"},
    { tag = "minecraft:music_disc_blocks", name = "C418 - blocks"},
    { tag = "minecraft:music_disc_chirp", name = "C418 - chirp"},
    { tag = "minecraft:music_disc_far", name = "C418 - far"},
    { tag = "minecraft:music_disc_mall", name = "C418 - mall"},
    { tag = "minecraft:music_disc_mellohi", name = "C418 - mellohi"},
    { tag = "minecraft:music_disc_stal", name = "C418 - stal"},
    { tag = "minecraft:music_disc_strad", name = "C418 - strad"},
    { tag = "minecraft:music_disc_ward", name = "C418 - ward"},
    { tag = "minecraft:music_disc_11", name = "C418 - 11"},
    { tag = "minecraft:music_disc_wait", name = "C418 - wait"},
    { tag = "minecraft:music_disc_pigstep", name = "Lena Raine - Pigstep"},
    { tag = "environmental:music_disc_leaving_home", name = "Hatsondogs - Leaving Home"},
    { tag = "environmental:music_disc_slabrave", name = "Mista Jub - Slabrave"},
    { tag = "environmental:music_disc_kilobyte", name = "Mista Jub - Kilobyte"},
    { tag = "variant16xmusic_disc_dog", name = "C418 - dog"},
    { tag = "botania:record_gaia_1", name = "Kain Vinosec - Endure emptiness"},
    { tag = "botania:record_gaia_2", name = "Kain Vinosec - Fight for quiescence"},
    { tag = "the_bumblezone:music_disc_flight_of_the_bumblebee_rimsky_korsakov", name = "Rimsky Korsakov - Flight of the bumblebee"},
    { tag = "the_bumblezone:music_disc_honey_bee_rat_faced_boy", name = "Rat Faced Boy - Honey bee"},
    { tag = "craftandhunt:sunken_temple_desc", name = "Dance with Golems - Flan"},
    { tag = "blue_skies:welcome_to_the_sky", name = "Voyed - Welcome to the sky"},
    { tag = "blue_skies:calm_waters", name = "Voyed - Calm waters"},
    { tag = "blue_skies:devine", name = "Voyed - Devine"},
    { tag = "blue_skies:soul", name = "Voyed - Soul"},
    { tag = "blue_skies:blinding_rage", name = "Jonathing - Blinding rage"},
    { tag = "blue_skies:defying_starlight", name = "Jonathing - Defying starlight"},
    { tag = "blue_skies:venomous_encounter", name = "Jonathing - Venomous encounter"},
    { tag = "edolon:music_disc_parousia", name = "Kitsune² - Parousia"},
    { tag = "alexsmobs:music_disc_thime", name = "LudoCrypt - Thime"},
    { tag = "alexsmobs:music_disc_daze", name = "LudoCrypt - Daze"},
    { tag = "rats:music_disc_mice_on_venus", name = "C418 - Mice on Venus"},
    { tag = "rats:music_disc_living_mice", name = "C418 - Living mice"},
    { tag = "simplefarming:music_disc_nourish", name = "Bearfan - Nourish"},
    { tag = "outer_end:music_disc_galactic_wave", name = "Blue Duck - Galactive wave"},
    { tag = "outer_end:music_disc_unknown_frontier", name = "Pyrocide - Unknown frontier"},
    { tag = "fins:music_disc_crashing_tides", name = "Mr. Esuoh - Crashing tides"},
}

print("Booting Apollo")
print("Type: Computer")
print("Prerequisites:")

print("Speaker peripheral mounted to slot left")
assert(peripheral.isPresent("left", "No peripheral found on side 'left'"))
assert(peripheral.getType("left") == "speaker", "Prerequisite speaker not found on side 'left'")
print("Check")

term.clear()

for index in ipairs(songs) / 2 do
    if index % 2 == 0 then
        term.setTextColor(colours.blue)
    else
        term.setTextColor(colours.lightBlue)
    end
    print(songs[index].name)
end