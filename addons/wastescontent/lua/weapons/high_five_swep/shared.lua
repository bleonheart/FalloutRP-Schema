/**
* Adding high five.
*
* @author Kyle James
* @version 8 August 2019
*/

SWEP.Purpose				= "You can now high five!"
SWEP.Instructions 			= "Click to high five."

SWEP.Category 				= "Darkwater Entertainment's Fallout DarkRP | Scripted Weapons Pack"
SWEP.PrintName				= "High Five"
SWEP.Spawnable				= true
SWEP.deactivateOnMove		= 110

SWEP.Base = "animation_swep_base"

if CLIENT then
	function SWEP:GetGesture()
		return {
	        ["ValveBiped.Bip01_L_Forearm"] = Angle(25,-65,25),
	        ["ValveBiped.Bip01_L_UpperArm"] = Angle(-70,-180,70),
	    }
	end
end
