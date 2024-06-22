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
    -- 播放自定义动画
    self:PlayAnimation(self.DamageAnim, 0, 1)
end

--function M:Tick(MyGeometry, InDeltaTime)
--end

return M
