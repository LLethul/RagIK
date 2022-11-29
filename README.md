# RagIK
A ragdoll animator for Roblox

## Docs

```lua
RagIK.new(Character)
--[[
    Character == Player.Character;
    Makes a new RagIK instance.
]]
```

```lua
RagIK:build()
--[[
    Requires a RagIK instance, builds the constraints that animate the character.
]]
```

```lua
RagIK:attachAll()
--[[
    Attaches all constraints. Requires a already built RagIK instance.
]]
```

```lua
RagIK:attachLegs()
--[[
    Attaches leg constraints. Requires a already built RagIK instance.
]]
```

```lua
RagIK:attachArms()
--[[
    Attaches arm constraints. Requires a already built RagIK instance.
]]
```
