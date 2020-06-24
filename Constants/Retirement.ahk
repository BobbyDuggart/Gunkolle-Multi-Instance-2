EnhancementDollSwitcher()
{	
	Global
	y:=0
	loop,2
	{
		rti := 0
		rti2 := 5
		tpc := 0
		loop
		{
			tpc := PixelGetColorS(TdollEnhancement_Lockx+179*rti,TdollEnhancement_Locky+304*y,1)
			if (tpc == TdollEnhancement_Lock)
			{
				ClickS(TdollEnhancement_Lockx+180*rti,TdollEnhancement_Locky+304*y)
				break
			}
			rti := rti+1
		}until (rti > rti2)
		if (tpc == TdollEnhancement_Lock)
		{
			break
		}
		y++
	}
}

Retirement()
{
Transition("CombatTdollEnhancement","Retirement")
	sleep 2000
	RFindClick("Retirement", "r2NDCLIENT mc o50 w30000,50")
	sleep 2000
	Transition("RetirementNotClicked","RetirementClicked") 
	RFindClick("TdollRetirementSelect", "r2NDCLIENT mc o75 w30000,50")
	sleep 1500
	RFindClick("SmartSelect", "r2NDCLIENT mc o75 w30000,50")
	sleep 1500
	RFindClick("Filter", "r2NDCLIENT mc o20 w30000,50")
	RFindClick("ThreeStar", "r2NDCLIENT mc o20 w30000,50")
	RFindClick("Confirm", "r2NDCLIENT mc o20 w30000,50")
	sleep 500
	Found := FindClick(A_ScriptDir "\pics\3STAR", "r2NDCLIENT mc o50 Count1 n0")
	if Found >= 1
	{
	ClickTilGone("3STAR", " r2NDCLIENT mc o75 w30000,50 sleep100")
	}
	sleep 500
	RFindClick("ConfirmRet", "r2NDCLIENT mc o75 w30000,50")
	sleep 1500
	RFindClick("TdollRetirementDismantle", "r2NDCLIENT mc o75 w30000,50")
	sleep 1500
	Found := FindClick(A_ScriptDir "\pics\RetireOK", "r2NDCLIENT mc o50 Count1 n1")
	Sleep 3000
	Transition("BaseNavigation","NavigateCombat")
	Transition("NavigateCombat","CombatPage")
}
	return

