DEFINE_BASECLASS( "npc_vj_creature_base" )
ENT.Type 			= "ai"
ENT.PrintName 		= "Deathclaw"
ENT.Author 			= "Lex"
ENT.Category		= "Fallout"

if (CLIENT) then
	local Name = "Deathclaw"
	local LangName = "vj_fallout_deathclaw"
	language.Add(LangName, Name)
	killicon.Add(LangName,"HUD/killicons/default",Color(255,80,0,255))
	language.Add("#"..LangName, Name)
	killicon.Add("#"..LangName,"HUD/killicons/default",Color(255,80,0,255))
end