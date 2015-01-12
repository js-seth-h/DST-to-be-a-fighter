name = "To Be A Fighter"
description = [===[
As a Fighter, Character have to be prepare battle.

----------------------------------------

    Good Features
======================

 = Combat Instinct =

When attack, automatically put on weapon, helmet and armor.

 = Defensive Instinct = 

When attacked or hostile closely approached, automatically put on armor and helmet

 = Damage indicators =

Show Damage and Heal HP.

 = Control in Gameplay = 

Widget Key (Default "C") show widget that control options.
Support only in DST, Not DS/ROG

4 button provided.

  Button 1. Toggle Enable Combat Instinct or Disable Combat Instinct in 5 Min.
  Button 2. Toggle Enable Defensive Instinct or Disable Combat Instinct in 5 Min.
  Button 3. In Combat Instinct if melee weapon equipped, Toggle Change weapon or not
  Button 3. In Combat Instinct if projectile weapon equipped, Toggle Change weapon or not 


  Mod Config Explain 
======================
 
* Combat Instinct
  Set Default Toggle state of Widget Button 1
* Defensive Instinct 
  Set Default Toggle state of Widget Button 2
* CI: Keep Melee
  Set Default Toggle state of Widget Button 3
* CI: Keep Projectile
  Set Default Toggle state of Widget Button 4

The Others Options is trivial.


]===]


author = "js.seth.h"
version = "1.2"

forumthread = ""

-- This lets other players know if your mod is out of date, update it to match the current version in the game
api_version = 10

-- Can specify a custom icon for this mod!
-- icon_atlas = "ExtendedIndicators.xml"
-- icon = "ExtendedIndicators.tex"

-- Specify compatibility with the game!
dont_starve_compatible = true
reign_of_giants_compatible = true
dst_compatible = true

all_clients_require_mod = false
clients_only_mod = false

server_filter_tags = {"battle", "fighter", "weapon", "damange indicators", "damange", "equipment"}

icon_atlas = "modicon.xml"
icon = "to-be-fighter.tex" 
local alpha = {"A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"}
local KEY_A = 97
local keyslist = {}
local Default_Key =  "C" 
for i = 1,#alpha do 
  keyslist[i] = {description = alpha[i],data = i + KEY_A - 1}
  if alpha[i] == Default_Key then
    Default_Key = keyslist[i].data
  end
end



configuration_options =
{
    {
        name = "togglekey",
        label = "Widget Button",
        options = keyslist,
        default = Default_Key
    },      
    -- {
    --   name = "FIGHTER_SENSE_TRIGGER",
    --   label = "Fighter Sense Trigger",
    --   options = {
    --     {description = "Universal", data = "universal"},
    --     {description = "Keyboard Only", data = "keyboard"},
    --   },

    --   default = "universal",

    -- },

    -- {
    --   name = "LIGHTNING_REFLEXES",
    --   label = "Lightning Reflexes",
    --   options = {
    --     {description = "On", data = "on"},
    --     {description = "Off", data = "off"},
    --   },

    --   default = "on", 
    -- },
    {
      name = "FS_COMBAT_INSTINCT",
      label = "Combat Instinct",
      options = {
        {description = "On", data = "on"},
        {description = "Off", data = "off"},
      },

      default = "on", 
    },
    {
      name = "FS_DEFENSIVE_INSTINCT",
      label = "Defensive Instinct",
      options = {
        {description = "On", data = "on"},
        {description = "Off", data = "off"},
      },

      default = "on", 
    },
    {
      name = "FS_HOLD_MELEE",
      label = "CI: Keep Melee",
      options = {
        {description = "On", data = "on"},
        {description = "Off", data = "off"},
      },

      default = "off", 
    },
    {
      name = "FS_HOLD_PROJECTILE",
      label = "CI: Keep Projectile ",
      options = {
        {description = "On", data = "on"},
        {description = "Off", data = "off"},
      },

      default = "on", 
    },

    {
      name = "SHOW_DAMAGE",
      label = "Show Damage",
      options = {
        {description = "On", data = "on"},
        {description = "Off", data = "off"},
      },

      default = "on",

    },
    {
      name = "SHOW_HEAL",
      label = "Show Heal",
      options = {
        {description = "On", data = "on"},
        {description = "Off", data = "off"},
      },

      default = "on",

    },

    -- {
    --   name = "display_mode",
    --   label = "Display Mode",
    --   options = {
    --     {description = "Bouncy", data = "bouncy"},
    --     {description = "Waving", data = "waving"},
    --     {description = "Straight", data = "straight"},
    --   },

    --   default = "waving",

    -- },


    {
      name = "HIDE_HP_CHANGES_LESS",
      label = "Hide HP Changes Less",
      options = {
        {description = "2 HP", data = "2"},
        {description = "5 HP", data = "5"},
        {description = "10 HP", data = "10"},
        {description = "20 HP", data = "20"},
      },

      default = "2",
    } 
  }
