DEFINE_BASECLASS( "npc_vj_creature_base" )
ENT.Type 			= "ai"
ENT.PrintName 		= "Scorpions"
ENT.Author 			= "Lex"
ENT.Category		= "Fallout"

if (CLIENT) then
	local Name = "Scorpions"
	local LangName = "vj_fallout_scorps"
	language.Add(LangName, Name)
	killicon.Add(LangName,"HUD/killicons/default",Color(255,80,0,255))
	language.Add("#"..LangName, Name)
	killicon.Add("#"..LangName,"HUD/killicons/default",Color(255,80,0,255))
end