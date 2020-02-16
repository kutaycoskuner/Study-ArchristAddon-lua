------------------------------------------------------------------------------------------------------------------------
-- Import: System, Locales, PrivateDB, ProfileDB, GlobalDB, PeopleDB, AlertColors AddonName
local A, L, V, P, G, C, M, N = unpack(select(2, ...));
local moduleName = 'spread';
local moduleAlert = M .. moduleName .. ": |r";
local module = A:GetModule(moduleName);
------------------------------------------------------------------------------------------------------------------------
-- ==== Variables
local isEnabled = true
local string1 = "{circle} Spread {circle}"
local string2 = ""
local string3 = ""

-- ==== Body
local function announceTank()
    if isEnabled then
        SendChatMessage(string1 .. string2 .. string3,"RAID_WARNING") -- RAID_WARNING, SAY
    end
end

-- ==== Slash commands [last arg]
SLASH_SPREAD1 = "/sp"
SLASH_SPREAD2 = "/spread"
SlashCmdList["SPREAD"] = function(msg) announceTank() end