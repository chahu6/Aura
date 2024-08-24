--
-- DESCRIPTION
--
-- @COMPANY **
-- @AUTHOR **
-- @DATE ${date} ${time}
--

---@type WBP_ProgressBar_C
local M = UnLua.Class()

-- function M:Initialize(Initializer)
-- end

-- function M:PreConstruct(IsDesignTime)
-- end

function M:Construct()
    self:SetBarVisible(false)
end

function M:Tick(MyGeometry, InDeltaTime)
    if self.ProgressBarVisible then
        self:InterpGhostBar(InDeltaTime)
    end
end

-- function M:UpdateGhostInterpTarget(Target)
--     self.HiddeTimerHandle:ClearandInvalidateTimerByHandle()
-- end

return M
