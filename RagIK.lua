local StarterPlayer = game:GetService("StarterPlayer")
local RagIK = {}
RagIK.__index = RagIK;
RagIK.__tostring = "RagIK";

local TemplateBlock = Instance.new("Part");
TemplateBlock.Size = Vector3.new(1,1,1);
TemplateBlock.CanCollide = false;
TemplateBlock.BrickColor = BrickColor.Red();
TemplateBlock.Transparency = 1;

function RagIK.new(char)
    local self = {}
    self.char = char

    return setmetatable(self, RagIK)
end

-- 11319521583

function RagIK:build()
    local LArmHint = TemplateBlock:Clone()
    LArmHint.Parent = self.char;
    LArmHint.Name = "LArmHint";

    local RArmHint = TemplateBlock:Clone()
    RArmHint.Parent = self.char;
    RArmHint.Name = "RArmHint";

    local LLegHint = TemplateBlock:Clone()
    LLegHint.Parent = self.char;
    LLegHint.Name = "LLegHint";

    local RLegHint = TemplateBlock:Clone()
    RLegHint.Parent = self.char;
    RLegHint.Name = "RLegHint";

    self.hints = {
        legs = {
            R = RLegHint;
            L = LLegHint;
        };

        arms = {
            R = RArmHint;
            L = LArmHint;
        }
    }

    for i,v in pairs(self.hints.arms) do
        local m6d = Instance.new("Motor6D", v);
        m6d.Part0 = self.char.UpperTorso;
        m6d.Part1 = v;

        if i == "R" then
            local attach1 = Instance.new("Attachment", v)
            attach1.Name = "RagIK1"

            local attach2 = Instance.new("Attachment", self.char.RightHand)
            attach2.Name = "RagIK2"
            m6d.C0 = CFrame.new(1.5, -0.69998312, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        end

        if i == "L" then
            local attach1 = Instance.new("Attachment", v)
            attach1.Name = "RagIK1"

            local attach2 = Instance.new("Attachment", self.char.LeftHand)
            attach2.Name = "RagIK2"
            m6d.C0 = CFrame.new(-1.5, -0.69998312, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        end

        local spr = Instance.new("SpringConstraint", v);
        spr.Name = "Spr"
        spr.Stiffness = 199;
        spr.Damping = 10;
        spr.FreeLength = 0.2;
        spr.LimitsEnabled = true;
        spr.MaxLength = 1.5;
        spr.Visible = false
        spr.Coils = 8
    end

    for i,v in pairs(self.hints.legs) do
        local m6d = Instance.new("Motor6D", v);
        m6d.Part0 = self.char.UpperTorso;
        m6d.Part1 = v;

        if i == "R" then
            local attach1 = Instance.new("Attachment", v)
            attach1.Name = "RagIK1"

            local attach2 = Instance.new("Attachment", self.char.RightFoot)
            attach2.Name = "RagIK2"
            m6d.C0 = CFrame.new(0.5, -3.69997263, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        end

        if i == "L" then
            local attach1 = Instance.new("Attachment", v)
            attach1.Name = "RagIK1"

            local attach2 = Instance.new("Attachment", self.char.LeftFoot)
            attach2.Name = "RagIK2"
            m6d.C0 = CFrame.new(-0.5, -3.69997263, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        end

        ---0.5, -1.69997263, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1

        local spr = Instance.new("TorsionSpringConstraint", v);
        spr.Name = "Spr"
        spr.Stiffness = 1200;
        spr.Damping = 10;
    end
end

function RagIK:attachAll()
    if self.hints == nil then
        return error("Call RagIK:build() first!")
    end

    for i,v in pairs(self.hints.arms) do
        v.Spr.Attachment0 = v.RagIK1;

        if i == "R" then
            v.Spr.Attachment1 = self.char.RightHand.RagIK2
        end

        if i == "L" then
            v.Spr.Attachment1 = self.char.LeftHand.RagIK2
        end
    end 

    for i,v in pairs(self.hints.legs) do
        v.Spr.Attachment0 = v.RagIK1;

        if i == "R" then
            v.Spr.Attachment1 = self.char.RightFoot.RagIK2
        end

        if i == "L" then
            v.Spr.Attachment1 = self.char.LeftFoot.RagIK2
        end
    end 
end

function RagIK:attachLegs()
    if self.hints == nil then
        return error("Call RagIK:build() first!")
    end

    for i,v in pairs(self.hints.legs) do
        v.Spr.Attachment0 = v.RagIK1;

        if i == "R" then
            v.Spr.Attachment1 = self.char.RightFoot.RagIK2
        end

        if i == "L" then
            v.Spr.Attachment1 = self.char.LeftFoot.RagIK2
        end
    end 
end

function RagIK:attachArms()
    if self.hints == nil then
        return error("Call RagIK:build() first!")
    end

    for i,v in pairs(self.hints.arms) do
        v.Spr.Attachment0 = v.RagIK1;

        if i == "R" then
            v.Spr.Attachment1 = self.char.RightHand.RagIK2
        end

        if i == "L" then
            v.Spr.Attachment1 = self.char.LeftHand.RagIK2
        end
    end
end

function RagIK:detachAll()
    if self.hints == nil then
        return error("Call RagIK:build() first!")
    end

    for i,v in pairs(self.hints.arms) do
        v.Spr.Attachment0 = nil;

        if i == "R" then
            v.Spr.Attachment1 = nil;
        end

        if i == "L" then
            v.Spr.Attachment1 = nil;
        end
    end 

    for i,v in pairs(self.hints.legs) do
        v.Spr.Attachment0 = nil;

        if i == "R" then
            v.Spr.Attachment1 = nil;
        end

        if i == "L" then
            v.Spr.Attachment1 = nil;
        end
    end 
end

return RagIK