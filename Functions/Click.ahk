;Click v1.61121

ClickS(x,y)
{
	global uid
	global Background
	global XDiff
	global YDiff
	global Class
	global ClickDelay
	global coffset
	Sleep ClickDelay
	WinActivateRestore()
	Random, xoff, -coffset, coffset
	Random, yoff, -coffset, coffset
	if Background = 1
	{
		SetControlDelay 0
		if Class = 0
		{
			tx := xoff+x
			ty := yoff+y
			ControlClick, x%tx% y%ty%, 2NDCLIENT,,,,NA Pos
		}
		else
		{
			tx := x-XDiff+xoff
			ty := y-YDiff+yoff
			ControlClick, %Class%, 2NDCLIENT,,,, x%tx% y%ty%
		}
	}
	else if Background = 0
	{
		tx := xoff+x
		ty := yoff+y
		Click %tx%, %ty%
	}
	return
}

ClickSS(x,y)
{
	global uid
	global Background
	global XDiff
	global YDiff
	global Class
	global ClickDelay
	global coffset
	Sleep ClickDelay
	WinActivateRestore()
	Random, xoff, -coffset, coffset
	Random, yoff, -coffset, coffset
	if Background = 1
	{
		SetControlDelay 0
		if Class = 0
		{
			tx := xoff+x
			ty := yoff+y
			loop,10
			ControlClick, x%tx% y%ty%, 2NDCLIENT,,WheelUp,,NA Pos

		}
		else
		{
			tx := x-XDiff+xoff
			ty := y-YDiff+yoff
			loop,10
			ControlClick, %Class%, 2NDCLIENT,,WheelUp,, x%tx% y%ty%
		}
	}
	else if Background = 0
	{
		tx := xoff+x
		ty := yoff+y
		Click %tx%, %ty%
	}
	return
}
