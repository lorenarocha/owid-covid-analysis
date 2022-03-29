import pyautogui
import time

class Refresher:
        
    def open_pbi(self, dashboard):
        pyautogui.PAUSE = 1
        pyautogui.press('winleft')
        pyautogui.write('power bi')
        pyautogui.press('enter')
        time.sleep(10)
        print('Power BI aberto com sucesso')
        self.open_dashboard(dashboard)
        
    def open_dashboard(self, dashboard):
        pyautogui.PAUSE = 1
        pyautogui.moveTo(x=46, y=43)
        pyautogui.click()
        time.sleep(2)
        pyautogui.moveTo(x=722, y=132)
        pyautogui.click()
        time.sleep(2)
        pyautogui.write(dashboard)
        pyautogui.press('enter')
        time.sleep(5)
        print('Dashboard encontrado')
        self.refresh_dashboard()
        
    def refresh_dashboard(self):
        pyautogui.PAUSE = 1
        pyautogui.moveTo(x=830, y=99)
        pyautogui.click()
        time.sleep(20)
        pyautogui.hotkey('ctrl', 's')
        print('Base de dados atualizada')
        self.publish_dashboard()
        
    def publish_dashboard(self):
        pyautogui.PAUSE = 1
        pyautogui.moveTo(x=1276, y=99)
        pyautogui.click()
        time.sleep(7)
        pyautogui.moveTo(x=767, y=469)
        pyautogui.click()
        pyautogui.moveTo(x=1116, y=657)
        pyautogui.click()
        pyautogui.moveTo(x=1046, y=622)
        pyautogui.click()
        time.sleep(5)
        pyautogui.moveTo(x=1136, y=652)
        pyautogui.click()
        pyautogui.hotkey('ctrl', 's')
        print('Publicação feita!')
        
        
        
        
        
        

