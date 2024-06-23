--
-- DESCRIPTION
--
-- @COMPANY **
-- @AUTHOR **
-- @DATE ${date} ${time}
--

---@type WBP_DamageText_C
local M = UnLua.Class()

--function M:Initialize(Initializer)
--end

--function M:PreConstruct(IsDesignTime)
--end

function M:Construct()
    self.Overridden.Construct(self)
    -- 播放自定义动画
    self:PlayAnimation(self.DamageAnim, 0, 1)
end

--function M:Tick(MyGeometry, InDeltaTime)
--end

function M:UpdateDamageText(DamageAmount)
    local Text = UE.UKismetTextLibrary.Conv_DoubleToText(DamageAmount, UE.ERoundingMode.HalfToEven, false, true, 1, 324, 0, 0)
    self.Text_Damage:SetText(Text)
end

return M
