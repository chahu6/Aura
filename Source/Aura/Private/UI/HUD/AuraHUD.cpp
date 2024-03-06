// Copyright Chahu


#include "UI/HUD/AuraHUD.h"
#include "UI/Widget/AuraUserWidget.h"
#include "UI/WidgetController/OverlayWidgetController.h"
#include "AbilitySystemComponent.h"

UOverlayWidgetController* AAuraHUD::GetOverlayWidgetController(const FWidgetControllerParams& WCParams)
{
	if (OverlayWidgetController == nullptr)
	{
		OverlayWidgetController = NewObject<UOverlayWidgetController>(this, OverlayWidgetControllerClass);
		OverlayWidgetController->SetWidgetControllerParams(WCParams);
		OverlayWidgetController->BindCallbacksToDependencies();
	}
	return OverlayWidgetController;
}

void AAuraHUD::InitOverlay(APlayerController* PC, APlayerState* PS, UAbilitySystemComponent* ASC, UAttributeSet* AS)
{
	checkf(OverlayWidgetClass, TEXT("Overlay Widget Class uninitialized"));
	checkf(OverlayWidgetControllerClass, TEXT("Overlay Widget Controller Class uninitialized"));

	if (APlayerController* PlayerController = GetOwningPlayerController())
	{
		UUserWidget* Widget = CreateWidget<UUserWidget>(PlayerController, OverlayWidgetClass);
		OverlayWidget = Cast<UAuraUserWidget>(Widget);

		const FWidgetControllerParams WCParams(PC, PS, ASC, AS);
		UOverlayWidgetController* WidgetController = GetOverlayWidgetController(WCParams);
		check(WidgetController);

		OverlayWidget->SetWidgetController(WidgetController);
		WidgetController->BroadcastInitialValue();

		Widget->AddToViewport();
	}
}
