/**
* Client side script for the scripted weapon based on Fallout: New Vegas' Vance's 9mm Submachine Gun.
*
* @author Kyle James
* @version 18 July 2019
*/

include('shared.lua')

SWEP.PrintName			= "Vance's 9mm Submachine Gun"					// 'Nice' Weapon name (Shown on HUD)	
SWEP.Slot				= 3							// Slot in the weapon selection menu
SWEP.SlotPos			= 1							// Position in the slot

// Override this in your SWEP to set the icon in the weapon selection
-- if (file.Exists("materials/weapons/weapon_mad_ak47.vmt","GAME")) then
	-- SWEP.WepSelectIcon	= surface.GetTextureID("weapons/weapon_mad_ak47")
-- end