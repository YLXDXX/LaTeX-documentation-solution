# Enter script code
import time
time.sleep(0.02)  # May need tweaking, up to 0.5
ouput = system.exec_command("~/.config/autokey/myscript/choice/fourchoices-no.sh")
time.sleep(0.005)  # May need tweaking, up to 0.5
cb = 'hello world'
clipboard.fill_selection(cb.upper())
keyboard.send_keys("<ctrl>+v")