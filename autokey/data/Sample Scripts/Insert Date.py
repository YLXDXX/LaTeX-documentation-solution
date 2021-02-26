output = system.exec_command("date +%Y/%m/%d---%H:%M | sed 's/---/ /'")
keyboard.send_keys(output)