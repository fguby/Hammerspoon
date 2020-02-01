hs.hotkey.bind({"ctrl"}, "T", function()
	a1, a2 = hs.dialog.textPrompt("天才定时器", "时间设置", "{number}: {s/m/h}", "确定", "取消", false)
  	if(a1 == "确定")
  		then
  			hs.alert.show("Success(..•˘_˘•..)")
  			clock = hs.menubar.new()
  			t = string.sub(a2, -1)
  			time = tonumber(string.sub(a2, 1, string.len(a2) - 1))
  			if(t == "m")
  				then
  					time = 60 * time
			elseif(t == "h")
				then
					time = 60 * 60 * time
			end
			start = 0
  			hs.timer.doUntil(function()
  				-- body
  				if(start >= time)
  					then
						clock:delete()
						hs.alert.show("定时器时间截止~")  
  						return true
				end
  			end, function()
  				clock:setTitle(time-start)
  				start = start + 1
  			end)
		end
end)