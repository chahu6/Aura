--
-- DESCRIPTION
--
-- @COMPANY **
-- @AUTHOR **
-- @DATE ${date} ${time}
--
local Screen = require("Utils.Screen")

---@type WBP_DamageText_C
local M = UnLua.Class()

-- function M:Initialize(Initializer)
-- end

--function M:PreConstruct(IsDesignTime)
--end

function M:Construct()
    self.Overridden.Construct(self)
    -- 播放自定义动画
    self:PlayAnimation(self.DamageAnim, 0, 1)
    self:PlayAnimation(self.HitMessageAnim, 0, 1)
end

--function M:Tick(MyGeometry, InDeltaTime)
--end

function M:UpdateDamageText(DamageAmount, bBlockedHit, bCriticalHit)
    local Text = UE.UKismetTextLibrary.Conv_DoubleToText(DamageAmount, UE.ERoundingMode.HalfToEven, false, true, 1, 324, 0, 0)
    self.Text_Damage:SetText(Text)
    local OutColor = self:GetColorBasedOnBlockandCrit(bBlockedHit, bCriticalHit)
    self.Text_Damage:SetColorAndOpacity(OutColor)
    local OutMessage = self:GetHitMessageBasedOnBlockandCrit(bBlockedHit, bCriticalHit)
    self.Text_HitMessage:SetText(OutMessage)
    self.Text_HitMessage:SetColorAndOpacity(OutColor)
end

function M:GetColorBasedOnBlockandCrit(bBlockedHit, bCriticalHit)
    local OutColor = UE.FSlateColor();
    if(bBlockedHit and not bCriticalHit) then
        OutColor.SpecifiedColor = UE.FLinearColor(0, 0, 0.65)
    elseif(not bBlockedHit and bCriticalHit) then
        OutColor.SpecifiedColor = UE.FLinearColor(0.65, 0, 0)
    elseif(bBlockedHit and bCriticalHit) then
        OutColor.SpecifiedColor = UE.FLinearColor(0.65, 0.5, 0.1)
    else
        OutColor.SpecifiedColor = UE.FLinearColor(0.65, 0.65, 0.65)
    end
    return OutColor
end

function M:GetHitMessageBasedOnBlockandCrit(bBlockedHit, bCriticalHit)
    local OutMessage
    if(bBlockedHit and not bCriticalHit) then
        OutMessage = "Blocked Hit!"
    elseif(not bBlockedHit and bCriticalHit) then
        OutMessage = "Critical Hit!"
    elseif(bBlockedHit and bCriticalHit) then
        OutMessage = "Blocked Critical Hit!"
    else
        OutMessage = "Hit"
    end
    return OutMessage
end

return M
