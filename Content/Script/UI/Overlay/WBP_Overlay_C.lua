--
-- DESCRIPTION
--
-- @COMPANY **
-- @AUTHOR **
-- @DATE ${date} ${time}
--

---@type WBP_Overlay_C
local M = UnLua.Class()

--function M:Initialize(Initializer)
--end

--function M:PreConstruct(IsDesignTime)
--end

function M:Construct()
    self.AttributeButton.Button.OnClicked:Add(self, self.OnAttributeButtonClicked)
    self.SpellMenuButton.Button.OnClicked:Add(self, self.OnSpellMenuButtonClicked)
end

--function M:Tick(MyGeometry, InDeltaTime)
--end
function M:OnSpellMenuButtonClicked()
    self:SpellMenuButtonClicked()
end

function M:OnAttributeButtonClicked()
    -- self.AttributeButton.Button:SetIsEnabled(false)
    -- local WBP_AttributeMenuClass = UE.UClass.Load("/Script/UMGEditor.WidgetBlueprint'/Game/Blueprints/UI/AttributeMenu/WBP_AttributeMenu.WBP_AttributeMenu_C'")
    -- local AttributeMenu = UE.UWidgetBlueprintLibrary.Create(self, WBP_AttributeMenuClass, self:GetOwningPlayer())
    -- local Position = UE.FVector2D(50, 50)
    -- AttributeMenu:SetPositionInViewport(Position, false)
    -- AttributeMenu:AddToViewport()
    -- AttributeMenu.AttributeMenuClose:Add(self, self.AttributeMenuClose_Event)
    self:AttributeButtonClicked()
end

-- function M:AttributeMenuClose_Event()
--     self.AttributeButton.Button:SetIsEnabled(true)
-- end

function M:WidgetControllerSet()
    self.WBP_HealthManaSpells:SetWidgetController(self.WidgetController)
    self.WBP_XPBar:SetWidgetController(self.WidgetController)
    self.WBP_ValueGlobe:SetWidgetController(self.WidgetController)
    self.WidgetController.MessageWidgetRowDelegate:Add(self, self.MessageWidgetRowDelegate_Event)
    self.WidgetController.OnPlayerLevelChangedDelegate:Add(self, self.OnPlayerLevelChangedDelegate_Event)
end

function M:MessageWidgetRowDelegate_Event(Row)
    local Widget = UE.UWidgetBlueprintLibrary.Create(self, Row.MessageWidget, self:GetOwningPlayer())
    local Position = UE.UWidgetLayoutLibrary.GetViewportSize(self)
    Position = Position * 0.5
    Widget:SetPositionInViewport(Position, true)
    Widget:SetImageAndText(Row.Message, Row.Image)
    Widget:AddToViewport()
end

return M
