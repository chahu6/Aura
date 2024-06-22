local M = {}

--[[ 
    static void PrintString(const UObject* WorldContextObject, 
            const FString& InString = FString(TEXT("Hello")), 
            bool bPrintToScreen = true, 
            bool bPrintToLog = true, 
            FLinearColor TextColor = FLinearColor(0.0, 0.66, 1.0), 
            float Duration = 2.f, 
            const FName Key = NAME_None); 
]]
local PrintString = UE.UKismetSystemLibrary.PrintString

function M.Print(text, color, duration)
    color = color or UE.FLinearColor(1, 1, 1, 1)
    duration = duration or 100
    PrintString(nil, text, true, false, color, duration)
end

return M