import time
try:
    selText = clipboard.get_selection()
    time.sleep(0.2)
    dialog.info_dialog(title='Text from selection', message=selText) 

except:
    dialog.info_dialog(title='No text selected', 
    message='No text in X selection') 