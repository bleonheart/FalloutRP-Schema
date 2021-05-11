/**
* Adding salute.
*
* @author Kyle James
* @version 8 August 2019
*/

SWEP.Purpose				= "You can salute!"
SWEP.Instructions 			= "Click to salute."

SWEP.Category 				= "Darkwater Entertainment's Fallout DarkRP | Scripted Weapons Pack"
SWEP.PrintName				= "Salute"
SWEP.Spawnable				= true
SWEP.deactivateOnMove		= 100

SWEP.Base = "animation_swep_base"

if CLIENT then
	function SWEP:GetGesture()
		return {
	        ["ValveBiped.Bip01_R_UpperArm"] = Angle(80, -95, -77.5),
	        ["ValveBiped.Bip01_R_Forearm"] = Angle(35, -125, -5),
	    }
	end
end
