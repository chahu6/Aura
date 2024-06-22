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

	// ��C++�г�ʼ��GameplayTag
	FAuraGameplayTags::InitializeNativeGameplayTags();

	// ����Ǳ����һ����ʼ������ȻTargetData�����ã�InitTargetDataScriptStructCache()��Ҫ�����
	UAbilitySystemGlobals::Get().InitGlobalData();
}
