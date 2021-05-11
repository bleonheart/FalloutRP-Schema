AddCSLuaFile("shared.lua")
include('shared.lua')
	-- General ---------------------------------------------------------------------------------------------------------------------------------------------
ENT.Model = "models/fallout/cazadore.mdl"
ENT.StartHealth = GetConVarNumber("vj_cazadore_h")
ENT.MovementType = VJ_MOVETYPE_AERIAL-- How does the SNPC move?
ENT.Aerial_CanPlayMoveAnimation = true
	-- Blood & Damages ---------------------------------------------------------------------------------------------------------------------------------------------
ENT.Bleeds = true
ENT.BloodColor = ""
ENT.HasBloodDecal = false
ENT.Immune_Dissolve = true
	-- Relationships ---------------------------------------------------------------------------------------------------------------------------------------------
ENT.VJ_NPC_Class = {"CLASS_CAZADORE"} -- NPCs with the same class with be allied to each other
	-- ====== On Player Sight Code ====== --
ENT.HasOnPlayerSight = false
ENT.AnimTbl_OnPlayerSight = {ACT_ARM}
ENT.OnPlayerSightDispositionLevel = 2 -- 0 = Run it every time | 1 = Run it only when friendly to player | 2 = Run it only when enemy to player
ENT.OnPlayerSightOnlyOnce = true
	-- Death ---------------------------------------------------------------------------------------------------------------------------------------------
ENT.HasDeathAnimation = false -- Does it play an animation when it dies?
ENT.AnimTbl_Death = {ACT_DIESIMPLE} -- Death Animations
ENT.DeathAnimationTime = 10 -- Time until the SNPC spawns its corpse and gets removed
ENT.HasDeathRagdoll = true -- If set to false, it will not spawn the regular ragdoll of the SNPC
	-- Leap Attack ---------------------------------------------------------------------------------------------------------------------------------------------
ENT.HasLeapAttack = false -- Should the SNPC have a leap attack?
ENT.AnimTbl_LeapAttack = "" -- Melee Attack Animations
ENT.LeapAttackAnimationDelay = 0 -- It will wait certain amount of time before playing the animation
ENT.LeapAttackAnimationFaceEnemy = false -- Should it face the enemy while playing the leap attack animation?
ENT.LeapAttackAnimationDecreaseLengthAmount = 0 -- This will decrease the time until starts chasing again. Use it to fix animation pauses until it chases the enemy.
ENT.LeapDistance = 40 -- The distance of the leap, for example if it is set to 500, when the SNPC is 500 Unit away, it will jump
ENT.LeapToMeleeDistance = 0 -- How close does it have to be until it uses melee?
	-- To use event-based attacks, set this to false:
ENT.TimeUntilLeapAttackDamage = 0.60 -- How much time until it runs the leap damage code?
ENT.NextLeapAttackTime = 2.5 -- How much time until it can use a leap attack?
ENT.NextLeapAttackTime_DoRand = false -- False = Don't use random time | Number = Picks a random number between the regular timer and this timer
ENT.NextAnyAttackTime_Leap = 1 -- How much time until it can use any attack again? | Counted in Seconds
ENT.NextAnyAttackTime_Leap_DoRand = false -- False = Don't use random time | Number = Picks a random number between the regular timer and this timer
ENT.LeapAttackReps = 1 -- How many times does it run the leap attack code?
ENT.StopLeapAttackAfterFirstHit = true -- Should it stop the leap attack from running rest of timers when it hits an enemy?
ENT.TimeUntilLeapAttackVelocity = 0.1 -- How much time until it runs the velocity code?
ENT.LeapAttackUseCustomVelocity = false -- Should it disable the default velocity system?
ENT.LeapAttackVelocityForward = 110 -- How much forward force should it apply?
ENT.LeapAttackVelocityUp = 500 -- How much upward force should it apply?
ENT.LeapAttackVelocityRight = 0 -- How much right force should it apply?
ENT.LeapAttackDamage = 100
ENT.LeapAttackDamageDistance = 100 -- How far does the damage go?
ENT.LeapAttackDamageType = DMG_SLASH -- Type of Damage
ENT.DisableLeapAttackAnimation = false -- if true, it will disable the animation code
	-- Melee Attack ---------------------------------------------------------------------------------------------------------------------------------------------
ENT.HasMeleeAttack = true
ENT.MeleeAttackDistance = 40
ENT.MeleeAttackDamageDistance = 100 -- How far the damage goes
ENT.MeleeAttackDamage = GetConVarNumber("vj_cazadore_d")
ENT.MeleeAttackDamageType = DMG_SLASH
ENT.AnimTbl_MeleeAttack = {"h2hattackpower","h2hattackright"}
ENT.MeleeAttackKnockBack_Right1 = 15 -- How far it will push you right | First in math.random
ENT.MeleeAttackKnockBack_Right2 = 15 -- How far it will push you right | Second in math.random
    -- Miscellaneous  ---------------------------------------------------------------------------------------------------------------------------------------------
ENT.AnimTbl_IdleStand = {ACT_IDLE} -- The idle animation when AI is enabled	
ENT.AnimTbl_Walk = {ACT_WALK} -- Set the walking animations | Put multiple to let the base pick a random animation when it moves
ENT.AnimTbl_Run = {ACT_RUN} -- Set the running animations | Put multiple to let the base pick a random animation when it moves
	-- ====== Sound File Paths ====== --
ENT.SoundTbl_FootStep = {"cazadore/foot/cazadore_foot01.mp3","cazadore/foot/cazadore_foot02.mp3","cazadore/foot/cazadore_foot03.mp3","cazadore/foot/cazadore_foot04.mp3","cazadore/foot/cazadore_foot05.mp3","cazadore/foot/cazadore_foot06.mp3","cazadore/foot/cazadore_foot07.mp3","cazadore/foot/cazadore_foot08.mp3","cazadore/foot/cazadore_foot09.mp3","cazadore/foot/cazadore_foot10.mp3"}
ENT.SoundTbl_Idle = {"cazadore/caz_chasevox01.mp3","cazadore/caz_chasevox02.mp3","cazadore/caz_chasevox03.mp3","cazadore/caz_chasevox04.mp3","cazadore/cazadore_wingturn01.mp3","cazadore/cazadore_wingturn02.mp3","cazadore/cazadore_wingturn03.mp3"}
ENT.SoundTbl_Breath = {""}
ENT.SoundTbl_CombatIdle = {"cazadore/cazadore_consciouslp.wav"}
ENT.SoundTbl_Alert = {""}
ENT.SoundTbl_BeforeMeleeAttack = {"cazadore/cazadore_bodyfall01.mp3","cazadore/cazadore_bodyfall02.mp3","cazadore/cazadore_bodyfall03.mp3","cazadore/cazadore_bodyfall04.mp3","cazadore/cazadore_sting_attack01.mp3","cazadore/cazadore_sting_attack02.mp3","cazadore/cazadore_sting_attack03.mp3","cazadore/cazadore_sting_attack04.mp3"}
ENT.SoundTbl_MeleeAttack = {"cazadore/cazadore_hit_sfx01.mp3","cazadore/cazadore_hit_sfx02.mp3","cazadore/cazadore_hit_sfx03.mp3"}
ENT.SoundTbl_Pain = {""}
ENT.SoundTbl_OnKilledEnemy = {""}
ENT.SoundTbl_Death = {"cazadore/cazadore_death_sfx01.mp3","cazadore/cazadore_death_sfx02.mp3","cazadore/cazadore_death_sfx03.mp3","cazadore/cazadore_death_sfx04.mp3"}
ENT.SoundTbl_SoundTrack = {""}
	
ENT.HasSoundTrack = true -- Does the SNPC have a sound track?
ENT.SoundTrackVolume = 0.3
ENT.IdleSoundChance = 4

ENT.GeneralSoundPitch1 = 100
ENT.GeneralSoundPitch2 = 100
ENT.MeleeAttackSoundPitch1 = 100
ENT.MeleeAttackMissSoundPitch1 = 100

function ENT:CustomOnAlert()
	if self.VJ_IsBeingControlled == true then return end
	self:VJ_ACT_PLAYACTIVITY(ACT_ARM,true,2,true)
end

function ENT:CustomOnInitialize()

			self.ExtraGunModel1 = ents.Create("prop_physics")
			self.ExtraGunModel1:SetModel("")
			self.ExtraGunModel1:SetLocalPos(self:GetPos())
			//self.ExtraGunModel1:SetPos(self:GetPos())
			self.ExtraGunModel1:SetOwner(self)
			self.ExtraGunModel1:SetParent(self)
			self.ExtraGunModel1:SetLocalAngles(Angle(-120,45,90))
			//self.ExtraGunModel1:Fire("SetParentAttachmentMaintainOffset","anim_attachment_LH")
			self.ExtraGunModel1:Fire("SetParentAttachment","anim_attachment_RH")
			self.ExtraGunModel1:SetCollisionGroup(COLLISION_GROUP_IN_VEHICLE)
			self.ExtraGunModel1:Spawn()
			self.ExtraGunModel1:Activate()
			self.ExtraGunModel1:SetSolid(SOLID_NONE)
			self.ExtraGunModel1:AddEffects(EF_BONEMERGE)
			self:SetCollisionBounds(Vector(-16,-16,0),Vector(16,16,90))
			
			
		
end

