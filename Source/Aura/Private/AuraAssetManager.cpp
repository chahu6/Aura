// Copyright Chahu


#include "AuraAssetManager.h"
#include "AuraGameplayTags.h"
#include "AbilitySystemGlobals.h"

UAuraAssetManager& UAuraAssetManager::Get()
{
	check(GEngine);

	UAuraAssetManager* AuraAssetManager = Cast<UAuraAssetManager>(GEngine->AssetManager);
	return *AuraAssetManager;
}

void UAuraAssetManager::StartInitialLoading()
{
	Super::StartInitialLoading();

	// 在C++中初始化GameplayTag
	FAuraGameplayTags::InitializeNativeGameplayTags();

	// 这个是必须的一个初始化，不然TargetData不能用，InitTargetDataScriptStructCache()主要是这个
	UAbilitySystemGlobals::Get().InitGlobalData();
}
