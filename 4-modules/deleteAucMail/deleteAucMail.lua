------------------------------------------------------------------------------------------------------------------------
-- Import: System, Locales, PrivateDB, ProfileDB, GlobalDB, PeopleDB, AlertColors AddonName
local A, L, V, P, G, C, M, N = unpack(select(2, ...));
local moduleName = 'deleteAucMail';
local moduleAlert = M .. moduleName .. ": |r";
local module = A:GetModule(moduleName); 
------------------------------------------------------------------------------------------------------------------------
-- ==== Start
function module:Initialize()
    self.initialized = true
    -- :: Register some events
    module:RegisterEvent("MAIL_SHOW"); -- MAIL_INBOX_UPDATE , MAIL_SHOW
end

-- ==== Methods
function module:MAIL_SHOW()

    local mails, current, deleted;
    if deleted == nil then deleted = 0 end
    mails = GetInboxNumItems() or 0;
    -- test
    for ii = 1, GetInboxNumItems(), 1 do
        current = GetInboxInvoiceInfo(ii)
        if current == "seller_temp_invoice" then
            GetInboxText(ii - deleted);
            DeleteInboxItem(ii - deleted);
            deleted = deleted + 1;
        end
    end
    if deleted == 0 then
        print(moduleAlert .. "total deleted: " .. deleted .. " total mails count: " .. mails)
    end
    -- test end
end

-- ==== End
local function InitializeCallback() module:Initialize() end
A:RegisterModule(module:GetName(), InitializeCallback)
