AddCSLuaFile("shared.lua")
include('shared.lua')

ENT.Model = {"models/fallout/molerat.mdl"} -- The game will pick a random model from the table when the SNPC is spawned | Add as many as you want
ENT.StartHealth = 175
ENT.HullType = HULL_HUMAN
ENT.HasHull = true -- Set to false to disable HULL
ENT.HullSizeNormal = true -- set to false to cancel out the self:SetHullSizeNormal()
ENT.HasSetSolid = true -- set to false to disable SetSolid
ENT.SightDistance = 2000 -- How far it can see
ENT.SightAngle = 80 -- The sight angle | Example: 180 would make the it see all around it | Measured in degrees and then converted to radians
ENT.TurningSpeed = 20 -- How fast it can turnENT.Bleeds = true -- Does the SNPC bleed? (Blood decal, particle, etc.)
ENT.Bleeds = true -- Does the SNPC bleed? (Blood decal, particle, etc.)
ENT.BloodColor = "Red" -- The blood type, this will determine what it should use (decal, particle, etc.)
ENT.HasBloodParticle = true -- Does it spawn a particle when damaged?
ENT.HasBloodDecal = true -- Does it spawn a decal when damaged?
ENT.HasBloodPool = true -- Does it have a blood pool?
ENT.BloodPoolSize = "Normal" -- What's the size of the blood pool?
ENT.AllowIgnition = true -- Can this SNPC be set on fire?
ENT.RunAwayOnUnknownDamage = true -- Should run away on damage
ENT.NextRunAwayOnDamageTime = 2 -- Until next run after being shot when not alerted
ENT.CallForBackUpOnDamage = true -- Should the SNPC call for help when damaged? (Only happens if the SNPC hasn't seen a enemy)
ENT.CallForBackUpOnDamageDistance = 2000 -- How far away the SNPC's call for help goes | Counted in World Units
ENT.CallForBackUpOnDamageUseCertainAmount = true -- Should the SNPC only call certain amount of people?
ENT.CallForBackUpOnDamageUseCertainAmountNumber = 2 -- How many people should it call if certain amount is enabled?
ENT.HasDeathRagdoll = true -- If set to false, it will not spawn the regular ragdoll of the SNPC
ENT.HasMeleeAttack = true -- Should the SNPC have a melee attack?
ENT.HasSounds = true -- Put to false to disable ALL sound
ENT.SoundTbl_FootStep = {"fosounds/vj_forpnpcs/molerat/npc_molerat_foot_01.mp3"}
ENT.SoundTbl_MeleeAttack = {"fosounds/vj_forpnpcs/molerat/npc_molerat_bite_01.mp3",
	"fosounds/vj_forpnpcs/molerat/npc_molerat_bite_02.mp3"}
ENT.SoundTbl_MeleeAttackMiss = {"fosounds/vj_forpnpcs/molerat/npc_molerat_bite_01.mp3"}
ENT.SoundTbl_Death = {"fosounds/vj_forpnpcs/molerat/npc_molerat_death_01.mp3",
	"fosounds/vj_forpnpcs/molerat/npc_molerat_death_02.mp3"}
ENT.SoundTbl_Idle = {"fosounds/vj_forpnpcs/molerat/npc_molerat_idle_01.mp3",
	"fosounds/vj_forpnpcs/molerat/npc_molerat_idle_02.mp3",
	"fosounds/vj_forpnpcs/molerat/npc_molerat_idle_03.mp3"}
ENT.DeathSoundLevel = 75
ENT.BringFriendsOnDeath = true -- Should the SNPC's friends come to its position before it dies?
ENT.BringFriendsOnDeathDistance = 2000 -- How far away does the signal go? | Counted in World Units
ENT.BringFriendsOnDeathUseCertainAmount = true -- Should the SNPC only call certain amount of people?
ENT.BringFriendsOnDeathUseCertainAmountNumber = 2 -- How many people should it call if certain amount is enabled?
ENT.CanFlinch = 1 -- 0 = Don't flinch | 1 = Flinch at any damage | 2 = Flinch only from certain damages
ENT.FlinchDamageTypes = {DMG_BULLET} -- If it uses damage-based flinching, which types of damages should it flinch from?
ENT.FlinchChance = 5 -- Chance of it flinching from 1 to x | 1 will make it always flinch
ENT.NextFlinchTime = 5 -- How much time until it can flinch again?
ENT.AnimTbl_Flinch = {"Hitreaction_Head",
	"Hitreaction_Leftleg",
	"Hitreaction_Rightleg"} -- If it uses normal based animation, use this
ENT.FlinchAnimationDecreaseLengthAmount = 0 -- This will decrease the time it can move, attack, etc. | Use it to fix animation pauses after it finished the flinch animation
--------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialize()
	self:DrawShadow( false )
end
--------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------
function ENT:MultipleMeleeAttacks()
	local EnemyDistance = self:VJ_GetNearestPointToEntityDistance(self:GetEnemy(),self:GetPos():Distance(self:GetEnemy():GetPos()))
	if EnemyDistance > 0 and EnemyDistance < 60 then
		if self:IsLineOfSightClear( self:GetEnemy() ) then
			self.MeleeAttackDistance = 60
			self.TimeUntilMeleeAttackDamage = 0.8
			self.NextAnyAttackTime_Melee = 0.8
			self.AnimTbl_MeleeAttack = {ACT_MELEE_ATTACK1}
			self.MeleeAttackAngleRadius = 125
			self.MeleeAttackAnimationFaceEnemy = true
			self.MeleeAttackDamage = 20
			self.MeleeAttackDamageAngleRadius = 125
			self.MeleeAttackDamageDistance = 60
			self.MeleeAttackDamageType = DMG_SLASH
			self.MeleeAttackAnimationDecreaseLengthAmount = 0
			self.MeleeAttackAnimationFaceEnemy = false
			self.NextMeleeAttackTime = 0.5 -- How much time until it can use a melee attack?
			self.NextAnyAttackTime_Melee = 1 -- How much time until it can use any attack again? | Counted in Seconds
			self.HasMeleeAttackKnockBack = true -- If true, it will cause a knockback to its enemy
			self.MeleeAttackKnockBack_Forward1 = 150 -- How far it will push you forward | First in math.random
			self.MeleeAttackKnockBack_Forward2 = 150 -- How far it will push you forward | Second in math.random
		end
	end
end