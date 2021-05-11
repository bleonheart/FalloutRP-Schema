function OnSlaveOwnerDeath(ply)
	if ply.Slaves then
		for k, v in pairs(ply.Slaves) do
			v.slavecollar:Remove()
		end
		table.Empty( ply.Slaves )
	end
end
hook.Add("DoPlayerDeath","OnSlaveOwnerDeath",OnSlaveOwnerDeath)