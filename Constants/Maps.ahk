#Include %A_ScriptDir%/Functions/Mouse.ahk

RunMap(x)
{
	if (x == "0_2")
	{
		0_2()
	}
	else if(x == "4_6_data")
	{
		4_6_data()
	}
	else if(x == "4_3E")
	{
		4_3E()
	}
	else if(x == "5_4_friendly")
	{
		5_4_friendly()
	}
}

WaitBattle()
{
	GuiControl,, NB, In Battle
	FindClick(A_ScriptDir "\pics\CombatPause", "r2NDCLIENT mc o30 Count1 n0 w30000,50")
	sleep 7500
	Loop
	{		
		Found := FindClick(A_ScriptDir "\pics\LoadScreen", "r2NDCLIENT mc o50 n0 Count1 w100,50")
		if Found >= 1
		{
			GuiControl,, NB, Finished battle
			break
		}
		else
		{
			;Safex, Safey dont click in a valid position
			ClickS(700,400)
			TerminateFound := FindClick(A_ScriptDir "\pics\Terminate", "r2NDCLIENT mc o30 Count1 n0 w1000")
			if TerminateFound >= 1
			{
				break
			}
		}
	}
}

WaitTurn(turn)
{
	Global
	GuiControl,, NB, Waiting Turn %turn%
	loop
	{
		Found := FindClick(A_ScriptDir "\pics\Turn" turn, "r2NDCLIENT mc o30 Count1 n0 w1000")
		if Found >= 1
		{
			break
		}
		else
		{
			TerminateFound := FindClick(A_ScriptDir "\pics\Terminate", "r2NDCLIENT mc o30 Count1 n0 w1000")
			if TerminateFound >= 1
			{
				GuiControl,, NB, SF moving
			}
			else
			{
				WaitBattle()
			}	
		}		
	}
	GuiControl,, NB, G&K turn started
	TFindClick("Planning", "PlanningReady")
}

WaitExecution()
{
	Global
	loop
	{		
		Found := FindClick(A_ScriptDir "\pics\Planning", "r2NDCLIENT mc o30 Count1 n0 w5000")
		if Found >= 1
		{
			break
		}
		else
		{
			EndTurnFound := FindClick(A_ScriptDir "\pics\EndTurn", "r2NDCLIENT mc o30 Count1 n0 w1000")
			if EndTurnFound >= 1 
			{
				GuiControl,, NB, Executing Plan			
			}
			else
			{
				WaitBattle()
			}
		}		
	}
}

nodes(nodecount)
{
	Global
	loop, %nodecount%
	{
		Found := 0
		FindClick(A_ScriptDir "\pics\CombatPause", "r2NDCLIENT mc o25 Count1 n0 w30000,50")
		sleep 5000
		while(Found == 0)
		{
			Found := 0
			Found := FindClick(A_ScriptDir "\pics\LoadScreen", "r2NDCLIENT mc o50 n0 Count1 w100,50")
			if Found >= 1
			{
			}
			else
			{
				sleep 50
				;ClickS(Safex,Safey)
				ClickS(700,400)
			}
			GuiControl,, NB, Waiting for end of combat = %found%
		}
		FindClick(A_ScriptDir "\pics\Turn", "r2NDCLIENT mc o50 Count1 n0 w30000,50")
		GuiControl,, NB, Waiting for next action
	}
}

eventnodes(nodecount)
{
	Global
	loop, %nodecount%
	{
		Found := 0
		FindClick(A_ScriptDir "\pics\CombatPause", "r2NDCLIENT mc o25 Count1 n0 w30000,50")
		sleep 5000
		while(Found == 0)
		{
			Found := 0
			Found := FindClick(A_ScriptDir "\pics\LoadScreen", "r2NDCLIENT mc o50 n0 Count1 w100,50")
			if Found >= 1
			{
			}
			else
			{
				sleep 50
				;ClickS(Safex,Safey)
				ClickS(700,125)
			}
			GuiControl,, NB, Waiting for end of combat = %found%
		}
		FindClick(A_ScriptDir "\pics\Turn", "r2NDCLIENT mc o50 Count1 n0 w30000,50")
		GuiControl,, NB, Waiting for next action
	}
}

nodeboss(nodecount)
{
	Global
	loop, %nodecount%
	{
		Found := 0
		FindClick(A_ScriptDir "\pics\CombatPause", "r2NDCLIENT mc o25 Count1 n0 w30000,50")
		sleep 5000
		while(Found == 0)
		{
			Found := 0
			Found := FindClick(A_ScriptDir "\pics\LoadScreen", "r2NDCLIENT mc o50 n0 Count1 w100,50")
			if Found >= 1
			{
			}
			else
			{
				sleep 50
				;ClickS(Safex,Safey)
				ClickS(700,125)
			}
			GuiControl,, NB, Waiting for end of combat = %found%
		}
		GuiControl,, NB, Waiting for next action
	}
}

;GoHome()
;{
;	Global
;	RetirementLoop := 1
;	loop, %RetirementLoop%
;	{
;		Found1 := 0
;		Found2 := 0
;		Found3 := 0
;		sleep 5000
;		while(Found1 == 0 && Found2 == 0)
;		{
;			Found1 := FindClick(A_ScriptDir "\pics\WaitForHome", "r2NDCLIENT mc o30 w250,50 Count1 n0 a1200,,,-600")
;			Found2 := FindClick(A_ScriptDir "\pics\DailyMessage", "r2NDCLIENT mc o40 Count1 n0")
;			if (Found1 >= 1 or Found2 >= 1)
;			{
;
;			}
;			else
;			{
;				Found3 := FindClick(A_ScriptDir "\pics\CombatReturn", "r2NDCLIENT mc o40 Count1 w100,50")
;				FoundExp := FindClick(A_ScriptDir "\pics\ExpeditionConfirm", "r2NDCLIENT mc o30 Count1")
;				if FoundExp >= 1
;				{
;					RetirementLoop++
;				}
;				ClickS(Homex+52,Homey)
;			}
;			GuiControl,, NB, %found1% %found2% %found3% 
;		}
;	}
;}

GoHome()
{
	Global
	RetirementLoop := 1
	loop, %RetirementLoop%
	{
		sleep 4000
		Found1 := 0
		sleep 4000
		Found2 := 0
		;Found3 := 0
		sleep 4000
		while(Found1 == 0)
		{
			Found1 := FindClick(A_ScriptDir "\pics\WaitForHome", "r2NDCLIENT mc o30 w250,50 Count1 n0 a1200,,,-600")
			if (Found1 >= 1)
			{

			}
			else
			{
                sleep 250
				Found2 := FindClick(A_ScriptDir "\pics\CombatReturn", "r2NDCLIENT mc o40 Count1 w100,50")
				;Found3 := FindClick(A_ScriptDir "\pics\CombatReturnEvent", "r2NDCLIENT mc o40 Count1 w100,50")
				Found4 := FindClick(A_ScriptDir "\pics\ReturnToBase", "r2NDCLIENT mc o40 Count1 w100,50")
				FoundLogin := FindClick(A_ScriptDir "\pics\Login01", "r2NDCLIENT mc o40 Count1 n0")
				FoundLogin2 := FindClick(A_ScriptDir "\pics\Login02", "r2NDCLIENT mc o40 Count1 n0")
				if FoundLogin >= 1
				{
					GuiControl,, NB, Login Collect Found
					loop, 2
					{
					FoundAchievement := FindClick(A_ScriptDir "\pics\Achievement", "r2NDCLIENT mc o40 Count1 n0 w500")
					if (FoundAchievement == true)
						{
							GuiControl,, NB, Achievement Found
							ClickS(130, 300)
							sleep 500
						}
					}
					FoundLogin01 := FindClick(A_ScriptDir "\pics\Login01", "r2NDCLIENT mc o40 Count1 n1 w500")
					sleep 500
					FoundDollLogin := FindClick(A_ScriptDir "\pics\DollLogin", "r2NDCLIENT mc o40 Count1 n0 w500")
					if (FoundDollLogin == true)
						{
							sleep 3000
							RFindClick("DollDrop", "r2NDCLIENT mc o50 w30000,50")
						}
					FoundLogin01 := FindClick(A_ScriptDir "\pics\Login01", "r2NDCLIENT mc o40 Count1 n1 w500")
					sleep 500
					RFindClick("Login02", "r2NDCLIENT mc o50 w30000,50")
					sleep 1000
					RFindClick("Login03", "r2NDCLIENT mc o50 w30000,50")
					sleep 1000
					loop, 2
					{
					FoundAchievement := FindClick(A_ScriptDir "\pics\Achievement", "r2NDCLIENT mc o40 Count1 n0 w500")
					if (FoundAchievement == true)
						{
							GuiControl,, NB, Achievement Found
							ClickS(130, 300)
							sleep 500
						}
					}
					RFindClick("Login04", "r2NDCLIENT mc o50 w30000,50")
					loopcount++
				}
				if FoundLogin2 >= 1
				{
					GuiControl,, NB, Login Collect Found
					RFindClick("Login02", "r2NDCLIENT mc o50 w30000,50")
					sleep 1000
					RFindClick("Login03", "r2NDCLIENT mc o50 w30000,50")
					sleep 1000
					loop, 2
					{
					FoundAchievement := FindClick(A_ScriptDir "\pics\Achievement", "r2NDCLIENT mc o40 Count1 n0 w500")
					if (FoundAchievement == true)
						{
							GuiControl,, NB, Achievement Found
							ClickS(130, 300)
							sleep 500
						}
					}
					RFindClick("Login04", "r2NDCLIENT mc o50 w30000,50")
				}
				FoundExp := FindClick(A_ScriptDir "\pics\ExpeditionConfirm", "r2NDCLIENT mc o30 Count1")
				if FoundExp >= 1
				{
					;sleep 1000
					RetirementLoop++
				}
				ClickS(765, 130)
			}
			GuiControl,, NB, Waiting for base = %found1% %found2%
		}
	}
}

GoHomeEvent()
{
	Global
	RetirementLoop := 1
	loop, %RetirementLoop%
	{
		Found1 := 0
		Found2 := 0
		;Found3 := 0
		sleep 4000
		while(Found1 == 0)
		{
			Found1 := FindClick(A_ScriptDir "\pics\WaitForHome", "r2NDCLIENT mc o30 w250,50 Count1 n0 a1200,,,-600")
			if (Found1 >= 1)
			{

			}
			else
			{
                sleep 250
				Found2 := FindClick(A_ScriptDir "\pics\CombatReturnEvent", "r2NDCLIENT mc o40 Count1 w100,50")
				Found3 := FindClick(A_ScriptDir "\pics\ReturnToBase", "r2NDCLIENT mc o40 Count1 w100,50")
				FoundLogin := FindClick(A_ScriptDir "\pics\Login01", "r2NDCLIENT mc o40 Count1 n0")
				FoundLogin2 := FindClick(A_ScriptDir "\pics\Login02", "r2NDCLIENT mc o40 Count1 n0")
				if FoundLogin >= 1
				{
					GuiControl,, NB, Login Collect Found
					loop, 2
					{
					FoundAchievement := FindClick(A_ScriptDir "\pics\Achievement", "r2NDCLIENT mc o40 Count1 n0 w500")
					if (FoundAchievement == true)
						{
							GuiControl,, NB, Achievement Found
							ClickS(130, 300)
							sleep 500
						}
					}
					FoundLogin01 := FindClick(A_ScriptDir "\pics\Login01", "r2NDCLIENT mc o40 Count1 n1 w500")
					sleep 500
					FoundDollLogin := FindClick(A_ScriptDir "\pics\DollLogin", "r2NDCLIENT mc o40 Count1 n0 w500")
					if (FoundDollLogin == true)
						{
							sleep 3000
							RFindClick("DollDrop", "r2NDCLIENT mc o50 w30000,50")
						}
					FoundLogin01 := FindClick(A_ScriptDir "\pics\Login01", "r2NDCLIENT mc o40 Count1 n1 w500")
					sleep 500
					RFindClick("Login02", "r2NDCLIENT mc o50 w30000,50")
					sleep 1000
					RFindClick("Login03", "r2NDCLIENT mc o50 w30000,50")
					sleep 1000
					loop, 2
					{
					FoundAchievement := FindClick(A_ScriptDir "\pics\Achievement", "r2NDCLIENT mc o40 Count1 n0 w500")
					if (FoundAchievement == true)
						{
							GuiControl,, NB, Achievement Found
							ClickS(130, 300)
							sleep 500
						}
					}
					RFindClick("Login04", "r2NDCLIENT mc o50 w30000,50")
					loopcount++
				}
				if FoundLogin2 >= 1
				{
					GuiControl,, NB, Login Collect Found
					RFindClick("Login02", "r2NDCLIENT mc o50 w30000,50")
					sleep 1000
					RFindClick("Login03", "r2NDCLIENT mc o50 w30000,50")
					sleep 1000
					loop, 2
					{
					FoundAchievement := FindClick(A_ScriptDir "\pics\Achievement", "r2NDCLIENT mc o40 Count1 n0 w500")
					if (FoundAchievement == true)
						{
							GuiControl,, NB, Achievement Found
							ClickS(130, 300)
							sleep 500
						}
					}
					RFindClick("Login04", "r2NDCLIENT mc o50 w30000,50")
				}
				FoundExp := FindClick(A_ScriptDir "\pics\ExpeditionConfirm", "r2NDCLIENT mc o30 Count1")
				if FoundExp >= 1
				{
					RetirementLoop++
				}
				ClickS(165, 328)
			}
			GuiControl,, NB, Waiting for base = %found1% %found2%
		}
	}
}

0_2()
{
	Global
	RetirementLoop := 1
	while (RetirementLoop != 0)
	{
		GuiControl,, NB, MapSelect
		sleep 4000
		ClickS(725, 430)
		sleep 3000
		RFindClick("Battle", "r2NDCLIENT mc o30 w30000,50")
		sleep 4000
		Found := FindClick(A_ScriptDir "\pics\CombatTdollEnhancement", "r2NDCLIENT mc o30 Count1 n0 w3000,50")
		if(Found == 1)
		{
			Retirement()
			RetirementLoop++
		}
		RetirementLoop--
	}
	loop, 1
	{
	FindClick(A_ScriptDir "\pics\Turn", "r2NDCLIENT mc o50 Count1 n0 w30000,50")
	GuiControl,, NB, CommandPost
	sleep 1500
	while(FindClick(A_ScriptDir "\pics\EchelonFormation", "r2NDCLIENT mc o25 Count1 n0") != 1)
		{
			ClickS(649, 401)
			sleep 1000
			Found := FindClick(A_ScriptDir "\pics\Close", "r2NDCLIENT mc o30 Count1 n1 ,50")
		}
	RFindClick("OK", "r2NDCLIENT mc o10 w30000,50 ")
	GuiControl,, NB, Heliport
	sleep 1500
	while(FindClick(A_ScriptDir "\pics\EchelonFormation", "r2NDCLIENT mc o25 Count1 n0") != 1)
		{
			ClickS(455, 395)
			sleep 1000
			Found := FindClick(A_ScriptDir "\pics\Close", "r2NDCLIENT mc o30 Count1 n1 ,50")
		}
	RFindClick("OK", "r2NDCLIENT mc o10 w30000,50 ")
	sleep 2000
	RFindClick("StartOperation", "r2NDCLIENT mc o25 w3000,10 a1000,620 n3 sleep200")
	GuiControl,, NB, Heliport
	sleep 3000
	while(FindClick(A_ScriptDir "\pics\EchelonFormation", "r2NDCLIENT mc o25 Count1 n0") != 1)
		{
			ClickS(455, 395)
			sleep 200
			ClickS(455, 395)
			sleep 1000
			Found := FindClick(A_ScriptDir "\pics\Close", "r2NDCLIENT mc o30 Count1 n1 ,50")
		}
	ClickTilGone("Resupply", " r2NDCLIENT mc o10 w30000,50")
	GuiControl,, NB, CommandPost
	sleep 2000
	ClickS(649, 401)
	sleep 1500
	RFindClick("PlanningMode", "r2NDCLIENT mc o10 w30000,50 ")
	GuiControl,, NB, Plan1
	sleep 1500
	ClickS(582, 99)
	GuiControl,, NB, Plan2
	sleep 1500
	ClickS(814, 115)
	sleep 1500
	RFindClick("Execute", "r2NDCLIENT mc o5 w30000,50")
	sleep 300
	nodes(5)
	sleep 3000
	Found := FindClick(A_ScriptDir "\pics\Maps\0_2\CriticallyDamaged", "r2NDCLIENT mc o30 Count1 n0 w1000,50")
	if(Found == 1)
	{
		RFindClick("EndTurn", "r2NDCLIENT mc o30 w30000,50 a1100,620 n3 sleep250")
		GoHome()
		loop, 5
		{
			Transition("Repair","RepairSlot")
		}
		RFindClick("RepairSlot", "r2NDCLIENT mc o50 w30000,50 a50,100,-1050,-100")
		RFindClick("RepairSlotWait", "r2NDCLIENT mc o30 w30000,50 n0 a0,100,-1000,-300")
		sleep 250
		WFindClick("Damage", "r2NDCLIENT mc")
		RFindClick("RepairOK", "r2NDCLIENT mc o50 w30000,50")
		RFindClick("RepairQuick", "r2NDCLIENT mc o50 w30000,50")
		RFindClick("RepairConfirm", "r2NDCLIENT mc o50 w30000,50")
		RFindClick("RepairReturnFaded", "r2NDCLIENT mc o50 w30000,50 ")
		RFindClick("RepairReturn", "r2NDCLIENT mc o50 w30000,50")
		continue
	}
	RFindClick("EndTurn", "r2NDCLIENT mc o30 w30000,50 a1100,620 n3 sleep250")
	GoHome()
	}
}

4_6_data()
{
	Global
	RetirementLoop := 1
	while (RetirementLoop != 0)
	{
		GuiControl,, NB, MapSelect
		sleep 5000
		DragDownToUp(500, 675, 350)
		sleep 5000
		ClickS(750, 625)
		RFindClick("Battle", "r2NDCLIENT mc o30 w30000,50")
		Found := FindClick(A_ScriptDir "\pics\CombatTdollEnhancement", "r2NDCLIENT mc o30 Count1 n0 w3000,50")
		if(Found == 1)
		{
			Retirement()
			RetirementLoop++
		}
		RetirementLoop--
	}
	Loop, 9
	{
		FindClick(A_ScriptDir "\pics\Turn", "r2NDCLIENT mc o50 Count1 n0 w30000,50")
		sleep 3500
		GuiControl,, NB, CommandPost
		while(FindClick(A_ScriptDir "\pics\Turn", "r2NDCLIENT mc o25 Count1 n0") = 1)
		{
			ClickS(842, 400)
			sleep 3000
		}
		RFindClick("OK", "r2NDCLIENT mc o10 w30000,50 ")
		sleep 2250
		Found := FindClick(A_ScriptDir "\pics\OK", "r2NDCLIENT mc o40 Count1 n0 w250")
		sleep 2250
		GuiControl,, NB, Heliport
		while(FindClick(A_ScriptDir "\pics\Turn", "r2NDCLIENT mc o25 Count1 n0") = 1)
		{
			ClickS(868, 62)
			sleep 3000
		}
		RFindClick("OK", "r2NDCLIENT mc o10 w30000,50 ")
		sleep 2250
		Found := FindClick(A_ScriptDir "\pics\OK", "r2NDCLIENT mc o40 Count1 n0 w250")
		sleep 2250
		RFindClick("StartCombat", "r2NDCLIENT mc o25 w3000,10 a1000,620 n3 sleep200")
		GuiControl,, NB, Heliport
		sleep 4000
		while(FindClick(A_ScriptDir "\pics\CommandFairy", "r2NDCLIENT mc o25 Count1 n0") != 1)
		{
			ClickS(868, 62)
			sleep 2000
		}	
		GuiControl,, NB, Node1
		sleep 2500
		ClickS(858, 121)
		FoundBattle := FindClick(A_ScriptDir "\pics\Maps\4_6\Ambush", "r2NDCLIENT mc o40 Count1 n0 w1500")
			if (FoundBattle == true)
				{
					ClickS(858, 121)
					sleep 500
					ClickS(858, 121)
					sleep 3000
					ClickTilGone("\Maps\4_6\CombatPause", " r2NDCLIENT mc o75 w30000,50 sleep1000")
					sleep 700
					FoundPause := FindClick(A_ScriptDir "\pics\Maps\4_6\CombatPause", "r2NDCLIENT mc o40 Count1 n1 w250")
					sleep 450
					FoundPause := FindClick(A_ScriptDir "\pics\Maps\4_6\CombatPause", "r2NDCLIENT mc o40 Count1 n1 w250")
					sleep 450
					GuiControl,, NB, Withdraw
					ClickS(426, 66)
					sleep 3500
					ClickS(800, 200)
					sleep 3500
					TFindClick("Terminate","TerminateRestart")
					sleep 2750
					ClickTilGone("TerminateRestart", " r2NDCLIENT mc o10 w30000,50")
					continue
				}	
		FoundDrop := FindClick(A_ScriptDir "\pics\Maps\4_6\DollNode", "r2NDCLIENT mc o40 Count1 n0")
			if (FoundDrop == true)
				{
					ClickS(810, 197)
					sleep 2500
					ClickS(810, 197)
					ClickTilGone("DollDrop", "r2NDCLIENT mc o10 w30000,50 ")
				}
		GuiControl,, NB, Node2
		ClickS(810, 197)
		sleep 2150
		ClickS(810, 197)
		sleep 3500
		GuiControl,, NB, Node3
		ClickS(745, 245)
		FoundBattle := FindClick(A_ScriptDir "\pics\Maps\4_6\Ambush", "r2NDCLIENT mc o40 Count1 n0 w1500")
			if (FoundBattle == true)
				{
					ClickS(858, 121)
					sleep 500
					ClickS(858, 121)
					sleep 3000
					ClickTilGone("\Maps\4_6\CombatPause", " r2NDCLIENT mc o75 w30000,50 sleep1000")
					sleep 700
					FoundPause := FindClick(A_ScriptDir "\pics\Maps\4_6\CombatPause", "r2NDCLIENT mc o40 Count1 n1 w250")
					sleep 450
					FoundPause := FindClick(A_ScriptDir "\pics\Maps\4_6\CombatPause", "r2NDCLIENT mc o40 Count1 n1 w250")
					sleep 450
					GuiControl,, NB, Withdraw
					ClickS(426, 66)
					sleep 3500
					ClickS(800, 200)
					sleep 3500
					TFindClick("Terminate","TerminateRestart")
					sleep 2750
					ClickTilGone("TerminateRestart", " r2NDCLIENT mc o10 w30000,50")
					continue
				}	
		FoundDrop := FindClick(A_ScriptDir "\pics\Maps\4_6\DollNode", "r2NDCLIENT mc o40 Count1 n0")
			if (FoundDrop == true)
				{
					ClickS(820, 271)
					sleep 2500
					ClickS(820, 271)
					ClickTilGone("DollDrop", "r2NDCLIENT mc o10 w30000,50 ")
				}
		GuiControl,, NB, Node4
		ClickS(820, 271)
		sleep 2150
		ClickS(820, 271)
		FoundBattle := FindClick(A_ScriptDir "\pics\Maps\4_6\Ambush", "r2NDCLIENT mc o40 Count1 n0 w1500")
			if (FoundBattle == true)
				{
					ClickS(858, 121)
					sleep 500
					ClickS(858, 121)
					sleep 3000
					ClickTilGone("\Maps\4_6\CombatPause", " r2NDCLIENT mc o75 w30000,50 sleep1000")
					sleep 700
					FoundPause := FindClick(A_ScriptDir "\pics\Maps\4_6\CombatPause", "r2NDCLIENT mc o40 Count1 n1 w250")
					sleep 450
					FoundPause := FindClick(A_ScriptDir "\pics\Maps\4_6\CombatPause", "r2NDCLIENT mc o40 Count1 n1 w250")
					sleep 450
					GuiControl,, NB, Withdraw
					ClickS(426, 66)
					sleep 3500
					ClickS(800, 200)
					sleep 3500
					TFindClick("Terminate","TerminateRestart")
					sleep 2750
					ClickTilGone("TerminateRestart", " r2NDCLIENT mc o10 w30000,50")
					continue
				}	
		FoundDrop := FindClick(A_ScriptDir "\pics\Maps\4_6\DollNode", "r2NDCLIENT mc o40 Count1 n0")
			if (FoundDrop == true)
				{
					ClickS(820, 271)
					sleep 2500
					ClickS(820, 271)
					ClickTilGone("DollDrop", "r2NDCLIENT mc o10 w30000,50 ")
				}
		ClickS(320, 180)
		sleep 2250
		TFindClick("Terminate","TerminateRestart")
		sleep 2750
		ClickTilGone("TerminateRestart", " r2NDCLIENT mc o10 w30000,50")
	}
	Loop, 1
	{
		GuiControl,, NB, Last reset
		FindClick(A_ScriptDir "\pics\Turn", "r2NDCLIENT mc o50 Count1 n0 w30000,50")
		sleep 3500
		GuiControl,, NB, CommandPost
		while(FindClick(A_ScriptDir "\pics\Turn", "r2NDCLIENT mc o25 Count1 n0") = 1)
		{
			ClickS(842, 400)
			sleep 3000
		}
		RFindClick("OK", "r2NDCLIENT mc o10 w30000,50 ")
		sleep 2250
		Found := FindClick(A_ScriptDir "\pics\OK", "r2NDCLIENT mc o40 Count1 n0 w250")
		sleep 2250
		GuiControl,, NB, Heliport
		while(FindClick(A_ScriptDir "\pics\Turn", "r2NDCLIENT mc o25 Count1 n0") = 1)
		{
			ClickS(868, 62)
			sleep 3000
		}
		RFindClick("OK", "r2NDCLIENT mc o10 w30000,50 ")
		sleep 2250
		Found := FindClick(A_ScriptDir "\pics\OK", "r2NDCLIENT mc o40 Count1 n0 w250")
		sleep 2250
		RFindClick("StartCombat", "r2NDCLIENT mc o25 w3000,10 a1000,620 n3 sleep200")
		GuiControl,, NB, Heliport
		sleep 4000
		while(FindClick(A_ScriptDir "\pics\CommandFairy", "r2NDCLIENT mc o25 Count1 n0") != 1)
		{
			ClickS(868, 62)
			sleep 2000
		}	
		GuiControl,, NB, Node1
		sleep 2500
		ClickS(858, 121)
		FoundBattle := FindClick(A_ScriptDir "\pics\Maps\4_6\Ambush", "r2NDCLIENT mc o40 Count1 n0 w1500")
			if (FoundBattle == true)
				{
					ClickS(858, 121)
					sleep 500
					ClickS(858, 121)
					sleep 3000
					ClickTilGone("\Maps\4_6\CombatPause", " r2NDCLIENT mc o75 w30000,50 sleep1000")
					sleep 700
					FoundPause := FindClick(A_ScriptDir "\pics\Maps\4_6\CombatPause", "r2NDCLIENT mc o40 Count1 n1 w250")
					sleep 450
					FoundPause := FindClick(A_ScriptDir "\pics\Maps\4_6\CombatPause", "r2NDCLIENT mc o40 Count1 n1 w250")
					sleep 450
					GuiControl,, NB, Withdraw
					ClickS(426, 66)
					sleep 3500
					ClickS(800, 200)
					sleep 3500
					TFindClick("Terminate","TerminateOK")
					sleep 2750
					ClickTilGone("TerminateOK", " r2NDCLIENT mc o10 w30000,50")
					continue
				}	
		FoundDrop := FindClick(A_ScriptDir "\pics\Maps\4_6\DollNode", "r2NDCLIENT mc o40 Count1 n0")
			if (FoundDrop == true)
				{
					ClickS(810, 197)
					sleep 2500
					ClickS(810, 197)
					ClickTilGone("DollDrop", "r2NDCLIENT mc o10 w30000,50 ")
				}
		GuiControl,, NB, Node2
		ClickS(810, 197)
		sleep 2150
		ClickS(810, 197)
		sleep 3500
		GuiControl,, NB, Node3
		ClickS(745, 245)
		FoundBattle := FindClick(A_ScriptDir "\pics\Maps\4_6\Ambush", "r2NDCLIENT mc o40 Count1 n0 w1500")
			if (FoundBattle == true)
				{
					ClickS(858, 121)
					sleep 500
					ClickS(858, 121)
					sleep 3000
					ClickTilGone("\Maps\4_6\CombatPause", " r2NDCLIENT mc o75 w30000,50 sleep1000")
					sleep 700
					FoundPause := FindClick(A_ScriptDir "\pics\Maps\4_6\CombatPause", "r2NDCLIENT mc o40 Count1 n1 w250")
					sleep 450
					FoundPause := FindClick(A_ScriptDir "\pics\Maps\4_6\CombatPause", "r2NDCLIENT mc o40 Count1 n1 w250")
					sleep 450
					GuiControl,, NB, Withdraw
					ClickS(426, 66)
					sleep 3500
					ClickS(800, 200)
					sleep 3500
					TFindClick("Terminate","TerminateOK")
					sleep 2750
					ClickTilGone("TerminateOK", " r2NDCLIENT mc o10 w30000,50")
					continue
				}	
		FoundDrop := FindClick(A_ScriptDir "\pics\Maps\4_6\DollNode", "r2NDCLIENT mc o40 Count1 n0")
			if (FoundDrop == true)
				{
					ClickS(820, 271)
					sleep 2500
					ClickS(820, 271)
					ClickTilGone("DollDrop", "r2NDCLIENT mc o10 w30000,50 ")
				}
		GuiControl,, NB, Node4
		ClickS(820, 271)
		sleep 2150
		ClickS(820, 271)
		FoundBattle := FindClick(A_ScriptDir "\pics\Maps\4_6\Ambush", "r2NDCLIENT mc o40 Count1 n0 w1500")
			if (FoundBattle == true)
				{
					ClickS(858, 121)
					sleep 500
					ClickS(858, 121)
					sleep 3000
					ClickTilGone("\Maps\4_6\CombatPause", " r2NDCLIENT mc o75 w30000,50 sleep1000")
					sleep 700
					FoundPause := FindClick(A_ScriptDir "\pics\Maps\4_6\CombatPause", "r2NDCLIENT mc o40 Count1 n1 w250")
					sleep 450
					FoundPause := FindClick(A_ScriptDir "\pics\Maps\4_6\CombatPause", "r2NDCLIENT mc o40 Count1 n1 w250")
					sleep 450
					GuiControl,, NB, Withdraw
					ClickS(426, 66)
					sleep 3500
					ClickS(800, 200)
					sleep 3500
					TFindClick("Terminate","TerminateOK")
					sleep 2750
					ClickTilGone("TerminateOK", " r2NDCLIENT mc o10 w30000,50")
					continue
				}	
		FoundDrop := FindClick(A_ScriptDir "\pics\Maps\4_6\DollNode", "r2NDCLIENT mc o40 Count1 n0")
			if (FoundDrop == true)
				{
					ClickS(820, 271)
					sleep 2500
					ClickS(820, 271)
					ClickTilGone("DollDrop", "r2NDCLIENT mc o10 w30000,50 ")
				}
		ClickS(320, 180)
		sleep 2250
		TFindClick("Terminate","TerminateOK")
		sleep 2750
		ClickTilGone("TerminateOK", " r2NDCLIENT mc o10 w30000,50")
	}
	GoHome()
}

4_3E()
{
	Global
	RetirementLoop := 1
	while (RetirementLoop != 0)
	{
		GuiControl,, NB, MapSelect
		sleep 3000
		ClickS(725, 548)
		RFindClick("Battle", "r2NDCLIENT mc o30 w30000,50")
		sleep 4000
		Found := FindClick(A_ScriptDir "\pics\CombatTdollEnhancement", "r2NDCLIENT mc o30 Count1 n0 w3000,50")
		if(Found == 1)
		{
			Retirement()
			RetirementLoop++
		}
		RetirementLoop--
	}
	loop, 1
	{
	FindClick(A_ScriptDir "\pics\Turn", "r2NDCLIENT mc o50 Count1 n0 w30000,50")
	GuiControl,, NB, Heliport
	sleep 1500
	while(FindClick(A_ScriptDir "\pics\EchelonFormation", "r2NDCLIENT mc o25 Count1 n0") != 1)
		{
			ClickS(855, 460)
			sleep 1000
			Found := FindClick(A_ScriptDir "\pics\Close", "r2NDCLIENT mc o30 Count1 n1 ,50")
		}
	RFindClick("OK", "r2NDCLIENT mc o10 w30000,50 ")
	GuiControl,, NB, CommandPost
	sleep 1500
	while(FindClick(A_ScriptDir "\pics\EchelonFormation", "r2NDCLIENT mc o25 Count1 n0") != 1)
		{
			ClickS(434, 400)
			sleep 1000
			Found := FindClick(A_ScriptDir "\pics\Close", "r2NDCLIENT mc o30 Count1 n1 ,50")
		}
	RFindClick("OK", "r2NDCLIENT mc o10 w30000,50 ")
	sleep 2000
	RFindClick("StartOperation", "r2NDCLIENT mc o25 w3000,10 a1000,620 n3 sleep200")
	GuiControl,, NB, CommandPost
	sleep 3000
	while(FindClick(A_ScriptDir "\pics\EchelonFormation", "r2NDCLIENT mc o25 Count1 n0") != 1)
		{
			ClickS(434, 400)
			sleep 200
			ClickS(434, 400)
			sleep 1000
			Found := FindClick(A_ScriptDir "\pics\Close", "r2NDCLIENT mc o30 Count1 n1 ,50")
		}
	ClickTilGone("Resupply", " r2NDCLIENT mc o10 w30000,50")
	GuiControl,, NB, Heliport
	sleep 2000
	ClickS(855, 460)
	sleep 1500
	RFindClick("PlanningMode", "r2NDCLIENT mc o10 w30000,50 ")
	GuiControl,, NB, Plan
	sleep 1500
	ClickS(838, 126)
	sleep 1500
	RFindClick("Execute", "r2NDCLIENT mc o5 w30000,50")
	nodes(4)
	sleep 3000
	Found := FindClick(A_ScriptDir "\pics\Maps\4_3E\CriticallyDamaged", "r2NDCLIENT mc o30 Count1 n0 w1000,50")
	if(Found == 1)
	{
		RFindClick("EndTurn", "r2NDCLIENT mc o30 w30000,50 a1100,620 n3 sleep250")
		GoHome()
		loop, 5
		{
			Transition("Repair","RepairSlot")
		}
		RFindClick("RepairSlot", "r2NDCLIENT mc o50 w30000,50 a50,100,-1050,-100")
		RFindClick("RepairSlotWait", "r2NDCLIENT mc o30 w30000,50 n0 a0,100,-1000,-300")
		sleep 250
		WFindClick("Damage", "r2NDCLIENT mc")
		RFindClick("RepairOK", "r2NDCLIENT mc o50 w30000,50")
		RFindClick("RepairQuick", "r2NDCLIENT mc o50 w30000,50")
		RFindClick("RepairConfirm", "r2NDCLIENT mc o50 w30000,50")
		RFindClick("RepairReturnFaded", "r2NDCLIENT mc o50 w30000,50 ")
		RFindClick("RepairReturn", "r2NDCLIENT mc o50 w30000,50")
		continue
	}
	RFindClick("EndTurn", "r2NDCLIENT mc o30 w30000,50 a1100,620 n3 sleep250")
	sleep 7000
	GoHome()
	}
}

5_4_friendly()
{
	Global
	GuiControl,, NB, MapSelect
	sleep 3000
	ClickS(716, 664)
	RFindClick("Battle", "r2NDCLIENT mc o30 w30000,50")
	FindClick(A_ScriptDir "\pics\Turn", "r2NDCLIENT mc o50 Count1 n0 w30000,50")
	if Found >= 1
	{
	}
	Else
	{
		GuiControl,, NB, Can't find map, Paused.
		Pause
	}
	while (true)
	{
		FindClick(A_ScriptDir "\pics\Turn", "r2NDCLIENT mc o50 Count1 n0 w30000,50")
		GuiControl,, NB, CommandPost
		sleep 3000
		while(FindClick(A_ScriptDir "\pics\EchelonFormation", "r2NDCLIENT mc o25 Count1 n0") != 1)
		{
			ClickS(840, 330)
			sleep 2000
			Found := FindClick(A_ScriptDir "\pics\Close", "r2NDCLIENT mc o30 Count1 n1 ,50")
		}
		RFindClick("OK", "r2NDCLIENT mc o10 w30000,50")
		sleep 1500
		RFindClick("StartCombat", "r2NDCLIENT mc o25 w3000,10 a1000,620 n3 sleep200")
		GuiControl,, NB, Heliport1
		sleep 3000
		while(FindClick(A_ScriptDir "\pics\EchelonFormation", "r2NDCLIENT mc o25 Count1 n0") != 1)
		{
			ClickS(425, 350)
			sleep 2000
			Found := FindClick(A_ScriptDir "\pics\Close", "r2NDCLIENT mc o30 Count1 n1 ,50")
		}
		RFindClick("Maps\5_4\Support", "r2NDCLIENT mc o50 w30000,50 ")  
		sleep 2000
		Found := FindClick(A_ScriptDir "\pics\Maps\5_4\FriendsDone", "r2NDCLIENT mc o30 Count1 w1000,50")
		if(Found >= 1)
		{
			GuiControl,, NB, Friends Done for today, select another map.
			Pause
		}
		RFindClick("Maps\5_4\SupportFriend", "r2NDCLIENT mc o50 w30000,50 ")
		sleep 1500
		RFindClick("OK", "r2NDCLIENT mc o20 w30000,50")
		GuiControl,, NB, Heliport2
		sleep 2000
		while(FindClick(A_ScriptDir "\pics\EchelonFormation", "r2NDCLIENT mc o25 Count1 n0") != 1)
		{
			ClickS(425, 560)
			sleep 2000
			Found := FindClick(A_ScriptDir "\pics\Close", "r2NDCLIENT mc o30 Count1 n1 ,50")
		}
		RFindClick("Maps\5_4\Support", "r2NDCLIENT mc o50 w30000,50 ")  
		sleep 2000
		Found := FindClick(A_ScriptDir "\pics\Maps\5_4\FriendsDone", "r2NDCLIENT mc o30 Count1 w1000,50")
		if(Found >= 1)
		{
			GuiControl,, NB, Friends Done for today, select another map.
			Pause
		}
		RFindClick("Maps\5_4\SupportFriend", "r2NDCLIENT mc o50 w30000,50 ")
		sleep 1500
		RFindClick("OK", "r2NDCLIENT mc o20 w30000,50")
		sleep 1500
		TFindClick("Terminate","TerminateRestart")
		sleep 1500
		RFindClick("TerminateRestart", "r2NDCLIENT mc o50 w30000,50")
		sleep 1500
		Found := FindClick(A_ScriptDir "\pics\TerminateRestart", "r2NDCLIENT mc o30 Count1 n1 ,50")
		FindClick(A_ScriptDir "\pics\Turn", "r2NDCLIENT mc o50 Count1 n0 w30000,50")
	}
		sleep 2000
		Found := FindClick(A_ScriptDir "\pics\Maps\5_4\FriendsDone", "r2NDCLIENT mc o30 Count1 w1000,50")
		if(Found >= 1)
		{
			GuiControl,, NB, Friends Done for today, select another map.
			Pause
		}
		Else
		{
			sleep 1500
			TFindClick("Terminate","TerminateRestart")
			sleep 1500
			RFindClick("TerminateRestart", "r2NDCLIENT mc o50 w30000,50")
			sleep 1500
			Found := FindClick(A_ScriptDir "\pics\TerminateRestart", "r2NDCLIENT mc o30 Count1 n1 ,50")
		}
}