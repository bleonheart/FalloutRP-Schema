

AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )

-- You can set pause between music.
local PAUSE = 5

-- You can edit this part to add your music!
-- Dur is a musics duration in seconds.
local MUSIC = 
{	
	{
		Snd = Sound( "music/song1.mp3" ),
		Dur = 254
	},

	{
		Snd = Sound( "music/song2.mp3" ),
		Dur = 187
	},

	{
		Snd = Sound( "music/song3.mp3" ),
		Dur = 174
	},

	{
		Snd = Sound( "music/song4.mp3" ),
		Dur = 305
	},

	{
		Snd = Sound( "music/song5.mp3" ),
		Dur = 148
	},

	{
		Snd = Sound( "music/song6.mp3" ),
		Dur = 134
	},

	{
		Snd = Sound( "music/song7.mp3" ),
		Dur = 161
	},

	{
		Snd = Sound( "music/song8.mp3" ),
		Dur = 202
	},	
	
	{
		Snd = Sound( "music/song9.mp3" ),
		Dur = 124
	},
	
	{
		Snd = Sound( "music/song10.mp3" ),
		Dur = 183
	},
	
	{
		Snd = Sound( "music/song11.mp3" ),
		Dur = 199
	},
	
	{
		Snd = Sound( "music/song12.mp3" ),
		Dur = 140
	},
	
	{
		Snd = Sound( "music/song13.mp3" ),
		Dur = 144
	},
	
	{
		Snd = Sound( "music/song14.mp3" ),
		Dur = 237
	},
	
	{
		Snd = Sound( "music/song15.mp3" ),
		Dur = 242
	},
	
	{
		Snd = Sound( "music/song16.mp3" ),
		Dur = 269
	},
	
	{
		Snd = Sound( "music/song17.mp3" ),
		Dur = 198
	},
	
	{
		Snd = Sound( "music/song18.mp3" ),
		Dur = 122
	},
	
	{
		Snd = Sound( "music/song19.mp3" ),
		Dur = 154
	},
	
	{
		Snd = Sound( "music/song20.mp3" ),
		Dur = 154
	},
	
	{
		Snd = Sound( "music/song21.mp3" ),
		Dur = 242
	},
	
	{
		Snd = Sound( "music/song22.mp3" ),
		Dur = 194
	},
		
	{
		Snd = Sound( "music/song23.mp3" ),
		Dur = 194
	},
		
	{
		Snd = Sound( "music/song23.mp3" ),
		Dur = 165
	},
	
	{
		Snd = Sound( "music/song24.mp3" ),
		Dur = 135
	}
}

-- Do not edit these as it could corrupt this entity!
include('shared.lua')
function ENT:SpawnFunction(ply, tr)
	if (!tr.Hit) then return end
	local SpawnPos = tr.HitPos + tr.HitNormal * 16
	local ent = ents.Create("Jukebox")
		ent:SetPos(SpawnPos)
	ent:Spawn()
	ent:Activate()
	ent:SetName("")
	ent.Damaged = false;
	self.On = false;
	self.Play = false;

	return ent
end
function ENT:Use(activator, ply)
	if activator:KeyDownLast(IN_USE) then return end 
	if (self.Damaged == true) then return end
	if (not ply:IsPlayer()) then return end
	if (!self.On) then
		local Mus = MUSIC[ math.random( 1, #MUSIC ) ]
		self.Sound = CreateSound(self.Entity, Mus.Snd )
		self.Sound:Play()
		self.On = true;
		self.Play = true;
		self.Duration = CurTime() + PAUSE + Mus.Dur
		self.Musicon = CurTime() + Mus.Dur
		self.Debug = 0
	else
		self.Sound:Stop()
		self.On = false;
	end
end
function ENT:Think()
	if (not self.Damaged == true) and (self.On == true) then
		if CurTime() > self.Musicon then 	
				self.Play = false;
				self.Sound:Stop()
				self.Debug = CurTime() + PAUSE
				if (CurTime() > self.Duration) and (self.On == true) then
					self.Play = true;
					self.Sound:Stop()
					local Mus = MUSIC[ math.random( 1, #MUSIC ) ]
					self.Sound = CreateSound(self.Entity, Mus.Snd )
					self.Sound:Play()
					self.Musicon = CurTime() + Mus.Dur
					self.Duration = CurTime() + PAUSE + Mus.Dur
				end
			if CurTime() > self.Debug and (self.Sound) then
					self.Sound:ChangePitch(99)
					self.Sound:ChangePitch(100)
					self.Debug = CurTime() + PAUSE	
			end
		end
	end
	if (self:WaterLevel() > 0) then
		util.BlastDamage(self.Entity, self.Entity, self.Entity:GetPos(), 1000, 10)
		local effectdata = EffectData()
		effectdata:SetOrigin( self.Entity:GetPos() )
 		util.Effect( "Explosion", effectdata, true, true )
		self.Entity:Remove()
	end
	self.Entity:NextThink(1)
end	

function ENT:OnRemove()
	if (self.Sound) then
		self.Sound:Stop()
	end
end
function ENT:OnTakeDamage(dmg)
	self.On = false;
	self.Damaged = false;
	if (self.Sound) then
		self.Sound:ChangePitch(65)
		self.Sound:FadeOut(10)
	end
end
function ENT:Initialize()
	self.On = false
	self.Entity:SetModel("models/props_lab/citizenradio.mdl")
	self.Entity:PhysicsInit(SOLID_VPHYSICS)

	self.Entity:SetMoveType(MOVETYPE_VPHYSICS)

	self.Entity:SetSolid(SOLID_VPHYSICS)


	local phys = self.Entity:GetPhysicsObject()

	
if (phys:IsValid()) then

		phys:Wake()

	end

end

