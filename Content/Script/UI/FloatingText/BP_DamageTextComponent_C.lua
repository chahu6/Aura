local Screen = require("Utils.Screen")
--
-- DESCRIPTION
--
-- @COMPANY **
-- @AUTHOR **
-- @DATE ${date} ${time}
--

---@type BP_DamageTextComponent_C
local M = UnLua.Class()

-- function M:Initialize(Initializer)
-- end

-- function M:ReceiveBeginPlay()
-- end

-- function M:ReceiveEndPlay()
-- end

-- function M:ReceiveTick(DeltaSeconds)
-- end

local function run(self)
    UE.UKismetSystemLibrary.Delay(self, 1)
    self:K2_DestroyComponent(self)
end

function M:SetDamageText(Damage, bBlockedHit, bCriticalHit)
    local UWidget = self:GetUserWidgetObject()
    local WBP_DamageTextClass = UE.UClass.Load("/Script/UMGEditor.WidgetBlueprint'/Game/Blueprints/UI/FloatingText/WBP_DamageText.WBP_DamageText_C'")
    local DamageText = UWidget:Cast(WBP_DamageTextClass)
    if DamageText then
        DamageText:UpdateDamageText(Damage, bBlockedHit, bCriticalHit)
        coroutine.resume(coroutine.create(run), self)
    end
end



return M
