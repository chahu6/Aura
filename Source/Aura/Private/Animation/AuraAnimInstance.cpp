// Copyright Chahu


#include "Animation/AuraAnimInstance.h"
#include "Character/AuraCharacter.h"

void UAuraAnimInstance::NativeInitializeAnimation()
{
	Super::NativeInitializeAnimation();

	AuraCharacter = Cast<AAuraCharacter>(TryGetPawnOwner());
}

void UAuraAnimInstance::NativeUpdateAnimation(float DeltaTime)
{
	Super::NativeUpdateAnimation(DeltaTime);

	if (AuraCharacter == nullptr) AuraCharacter = Cast<AAuraCharacter>(TryGetPawnOwner());

	if (AuraCharacter == nullptr) return;

	GroundSpeed = AuraCharacter->GetVelocity().Size2D();
	bShouldMove = GroundSpeed > 3.0f;
}
