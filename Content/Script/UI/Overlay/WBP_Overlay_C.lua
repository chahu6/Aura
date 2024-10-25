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
    self.AttributeButton.Button.OnClicked:Add(self, self.OnClicked_Open)

end

--function M:Tick(MyGeometry, InDeltaTime)
--end

function M:OnClicked_Open()
    self:AttributeButtonClicked()
end

function M:AttributeButtonClicked()
    self.AttributeButton.Button:SetIsEnabled(false)
    local WBP_AttributeMenuClass = UE.UClass.Load("/Script/UMGEditor.WidgetBlueprint'/Game/Blueprints/UI/AttributeMenu/WBP_AttributeMenu.WBP_AttributeMenu_C'")
    local AttributeMenu = UE.UWidgetBlueprintLibrary.Create(self, WBP_AttributeMenuClass, self:GetOwningPlayer())
    local Position = UE.FVector2D(50, 50)
    AttributeMenu:SetPositionInViewport(Position, false)
    AttributeMenu:AddToViewport()
    AttributeMenu.AttributeMenuClose:Add(self, self.AttributeMenuClose_Event)
end

function M:AttributeMenuClose_Event()
    self.AttributeButton.Button:SetIsEnabled(true)
end

function M:WidgetControllerSet()
    self.WBP_HealthManaSpells:SetWidgetController(self.WidgetController)
    self.New
    self.WidgetController.MessageWidgetRowDelegate:Add(self, self.MessageWidgetRowDelegate_Event)
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
