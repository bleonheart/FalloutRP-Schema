/**
* Scripted weapon base for the Surrender animation.
*
* @author Kyle James
* @version 17 July 2019, 00:32:36.00
*/

SWEP.Purpose				= "Allows you to surrender."
SWEP.Instructions 			= "Click to surrender."

SWEP.Category 				= "Darkwater Entertainment's Fallout DarkRP | Scripted Weapons Pack"
SWEP.PrintName				= "Surrender"
SWEP.Spawnable				= true
SWEP.deactivateOnMove		= 110

SWEP.Base = "animation_swep_base"

if CLIENT then
	function SWEP:GetGesture()
		return {
	        ["ValveBiped.Bip01_L_Forearm"] = Angle(25,-65,25),
	        ["ValveBiped.Bip01_R_Forearm"] = Angle(-25,-65,-25),
	        ["ValveBiped.Bip01_L_UpperArm"] = Angle(-70,-180,70),
	        ["ValveBiped.Bip01_R_UpperArm"] = Angle(70,-180,-70),
	    }
	end
end
