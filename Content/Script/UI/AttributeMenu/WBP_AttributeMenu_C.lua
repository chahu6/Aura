--
-- DESCRIPTION
--
-- @COMPANY **
-- @AUTHOR **
-- @DATE ${date} ${time}
--

---@type WBP_AttributeMenu_C
local M = UnLua.Class()

--function M:Initialize(Initializer)
--end

--function M:PreConstruct(IsDesignTime)
--end

function M:Construct()
    self.CloseButton.Button.OnClicked:Add(self, self.OnClicked_Close)
    self:SetAttributeTags()
    local WidgetController = UE.UAuraAbilitySystemLibrary.GetAttributeMenuWidgetController(self)
    self:SetWidgetController(WidgetController)
    self.WBP_AttributePointsRow:SetWidgetController(WidgetController)
    WidgetController.OnAttributePointsChangedDelegate:Add(self, self.SetButtonsEnabled)
    WidgetController:BroadcastInitialValue()
end

function M:SetButtonsEnabled(AttributePoints)
    if AttributePoints > 0 then
        self.Row_Intelligence:SetButtonEnabled(true)
        self.Row_Strength:SetButtonEnabled(true)
        self.Row_Resilience:SetButtonEnabled(true)
        self.Row_Vigor:SetButtonEnabled(true)
    else
        self.Row_Intelligence:SetButtonEnabled(false)
        self.Row_Strength:SetButtonEnabled(false)
        self.Row_Resilience:SetButtonEnabled(false)
        self.Row_Vigor:SetButtonEnabled(false)
    end
end

--function M:Tick(MyGeometry, InDeltaTime)
--end

function M:Destruct()
    self.AttributeMenuClose:Broadcast()
end

function M:OnClicked_Close()
    self:RemoveFromParent()
end

function M:SetAttributeTags()
    self:SetPrimaryAttributeTags()
    self:SetSecondaryAttributeTags()
    self:SetResistanceAttributeTags()
end

function M:SetPrimaryAttributeTags()
    self.Row_Strength.AttributeTag.TagName = "Attributes.Primary.Strength"
    self.Row_Intelligence.AttributeTag.TagName = "Attributes.Primary.Intelligence"
    self.Row_Vigor.AttributeTag.TagName = "Attributes.Primary.Vigor"
    self.Row_Resilience.AttributeTag.TagName = "Attributes.Primary.Resilience"
end

function M:SetSecondaryAttributeTags()
    self.Row_Armor.AttributeTag.TagName = "Attributes.Secondary.Armor"
    self.Row_ArmorPenetration.AttributeTag.TagName = "Attributes.Secondary.ArmorPenetration"
    self.Row_BlockChance.AttributeTag.TagName = "Attributes.Secondary.BlockChance"
    self.Row_CriticalHitChance.AttributeTag.TagName = "Attributes.Secondary.CriticalHitChance"
    self.Row_CriticalHitDamage.AttributeTag.TagName = "Attributes.Secondary.CriticalHitDamage"
    self.Row_CriticalHitResistance.AttributeTag.TagName = "Attributes.Secondary.CriticalHitResistance"
    self.Row_HealthRegeneration.AttributeTag.TagName = "Attributes.Secondary.HealthRegeneration"
    self.Row_ManaRegeneration.AttributeTag.TagName = "Attributes.Secondary.ManaRegeneration"
    self.Row_MaxHealth.AttributeTag.TagName = "Attributes.Secondary.MaxHealth"
    self.Row_MaxMana.AttributeTag.TagName = "Attributes.Secondary.MaxMana"
end

function M:SetResistanceAttributeTags()
    self.Row_FireResistance.AttributeTag.TagName = "Attributes.Resistance.Fire"
    self.Row_LightningResistance.AttributeTag.TagName = "Attributes.Resistance.Lightning"
    self.Row_ArcaneResistance.AttributeTag.TagName = "Attributes.Resistance.Arcane"
    self.Row_PhysicalResistance.AttributeTag.TagName = "Attributes.Resistance.Physical"
end

return M
