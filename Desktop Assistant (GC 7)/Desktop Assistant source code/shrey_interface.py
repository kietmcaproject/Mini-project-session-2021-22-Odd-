from shreyUI import Ui_shreyUI
from PyQt5 import QtCore,QtGui,QtWidgets
from PyQt5.QtCore import *
from PyQt5.QtGui import QMovie
from PyQt5.QtGui import *
from PyQt5.QtWidgets import *
from PyQt5.QtCore import Qt,QTime,QTimer,QDate
from PyQt5.uic import loadUiType
import shrey
import sys
import datetime
import requests
from bs4 import BeautifulSoup



class MainThread(QThread):
    def __init__(self):
        super(MainThread,self).__init__()
        

    def run(self):
            shrey.wishme()
            shrey.task_gui()

startfunctions=MainThread()            


class gui_start(QMainWindow):
    def __init__(self):
        super().__init__()
        self.gui=Ui_shreyUI()
        self.gui.setupUi(self)
        self.gui.start_button.clicked.connect(self.startTask)
        self.gui.exit_button.clicked.connect(self.close)
        temp1=self.temp()
        self.label_te='Temperature : '+temp1
        



    def startTask(self):
        self.gui.label1=QtGui.QMovie("../projects/desktop assistant version 1.0/B.G//Iron_Template_1.gif")
        self.gui.gif1.setMovie(self.gui.label1)
        self.gui.label1.start()

        self.gui.label2=QtGui.QMovie("../projects/desktop assistant version 1.0/ExtraGui//Jarvis_Gui (2).gif")
        self.gui.gif2.setMovie(self.gui.label2)
        self.gui.label2.start()

        self.gui.label3=QtGui.QMovie("../projects/desktop assistant version 1.0/VoiceReg//__1.gif")
        self.gui.gif3.setMovie(self.gui.label3)
        self.gui.label3.start()

        self.gui.label4=QtGui.QMovie("../projects/desktop assistant version 1.0/ExtraGui//Hero_Template.gif")
        self.gui.gif4.setMovie(self.gui.label4)
        self.gui.label4.start()
        
        self.gui.label5=QtGui.QMovie("../projects/desktop assistant version 1.0/ExtraGui//Earth_Template.gif")
        self.gui.gif5.setMovie(self.gui.label5)
        self.gui.label5.start()


        timer=QTimer(self)
        timer.timeout.connect(self.showTimeLive)
        timer.start(999)

        startfunctions.start()



    def tellDay(self):
        day = datetime.datetime.today().weekday()+1
        
        day_dict = {1: 'Monday', 2: 'Tuesday', 3: 'Wednesday',
                    4: 'Thursday', 5: 'Friday', 6: 'Saturday',
                    7: 'Sunday'}
        
        if day in day_dict.keys():
            day_of_the_week = day_dict[day]  

        return day_of_the_week      



    def temp(self):
        k='temperature in ghaziabad'
        url =f"https://google.com/search?q={k}"
        r=requests.get(url)
        data=BeautifulSoup(r.text,'html.parser') #webscrapping
        t=data.find('div',class_='BNeawe').text
        return t 


    def showTimeLive(self):
        t=QTime.currentTime()
        time=t.toString('hh:mm:ss')
        d=QDate.currentDate()
        date=d.toString()
        label_t='Time : '+time
        label_d='Date : '+date

        
        day=self.tellDay()
        label_day='Day : '+day

       
        
        self.gui.text_time.setText(label_t)
        self.gui.text_date.setText(label_d)
        self.gui.text_day.setText(label_day)
        self.gui.text_temp.setText(self.label_te)
        

guiapp=QApplication(sys.argv)
shrey_gui=gui_start()
shrey_gui.show()
exit(guiapp.exec_())
