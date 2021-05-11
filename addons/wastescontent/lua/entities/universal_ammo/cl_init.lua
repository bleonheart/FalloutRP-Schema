/**
* Client side, draw the model.
*
* @author Kyle James
* @version 19 July 2019
*/

include("shared.lua")

function ENT:Draw()
    self:DrawModel()

    local Pos = self:GetPos()
    local Ang = self:GetAngles()

 	Ang:RotateAroundAxis(Ang:Right(), 270)
    Ang:RotateAroundAxis(Ang:Up(), 90)

end
