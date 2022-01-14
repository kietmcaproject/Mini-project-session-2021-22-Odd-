#from ssl import _PeerCertRetDictType
#from urllib.parse import quote_from_bytes
import pyttsx3  # text-to-speech conversion
import speech_recognition as sr   #convert speech to text
import datetime   #for fetching date and time
import wikipedia  # to search on wikipedia
import webbrowser  # to use browser and search things 
import smtplib  #SMTP client session object that can be used to send mail to any 
                #Internet machine with an SMTP or ESMTP listener daemon


import os    # to save/open files 
import playsound  # to play saved mp3 file
import time
import wordtodigits  # to convert spoken words into digits
import random
import requests
from bs4 import BeautifulSoup
import pywhatkit
import pyautogui
import keyboard
from pynput.keyboard import Key, Controller
import pyjokes
from PyDictionary import PyDictionary as dicword
from tkinter import Label
from tkinter import Entry
from tkinter import Button
from tkinter import Tk
from tkinter import StringVar
from pytube import YouTube 
from googletrans import Translator
from app import ChatApplication 
import detect_mask_video 


MASTER = 'shreyansh'
voice_id=0
engine = pyttsx3.init('sapi5') #pyttsx3 module supports two voices first is female and the second 
                            #is male which is provided by “sapi5” for windows

voices = engine.getProperty('voices')
newVoiceRate = 145  # greater value = more speed 
engine.setProperty('rate',newVoiceRate)  #to make the voice go slower so that it can be easily understood
#print(voices)
engine.setProperty('voice', voices[voice_id].id) #0 =male , 1=female


def changeVoice(e):
    if e==0:
        global voice_id
        voice_id=1
        engine.setProperty('voice', voices[voice_id].id)

    else:
        voice_id=0
        engine.setProperty('voice', voices[voice_id].id)




def speak(text):
    engine.say(text)
    engine.runAndWait()




def wishme():
    hour = int(datetime.datetime.now().hour)
    if hour >= 0 and hour < 12:
        print('\nGood morning '+MASTER+'\n')
        speak('Good morning'+MASTER)

    elif hour >= 12 and hour < 18:
        print('good afternoon '+MASTER+'\n')
        speak('good afternoon'+MASTER)

    else:
        print('good evening '+MASTER+'\n')
        speak('good evening'+MASTER)

    print(f'\nhello {MASTER}, I am shrey your desktop assistant....How may i help you ?\n')
    speak(f'hello {MASTER}, I am shrey your desktop assistant....How may i help you ?')
# print((sr.Microphone.list_microphone_names()))



def takeCommand():
    
    r = sr.Recognizer()
    with sr.Microphone(device_index=0) as source:

        print('\n\nListening..say something: \n')
        speak('Recognizing...please speak')
        # use the default microphone as the audio source
        r.adjust_for_ambient_noise(source, duration=1) #wait for 10 seconds
        r.pause_threshold = 0.5
        audio = r.listen(source)

    
    try:
        query = r.recognize_google(audio,language='en-in') #langauge indian-english 
        print(f'\nYou said: {query}\n')

    except sr.RequestError:
        print("\nSorry, I can't access the Google API...\n") 
        speak("Sorry, I can't access the Google API...\n")  


    except sr.UnknownValueError:
        print("\nSorry, Unable to recognize your speech...\n")
        speak("\nSorry, Unable to recognize your speech...")
        query = None 

    #query=input()
    return query 



def takehindi():
    r = sr.Recognizer()
    with sr.Microphone(device_index=0) as source:

        print('\n\nListening..say something: \n')
        speak('Recognizing...please speak')
        # use the default microphone as the audio source
        r.adjust_for_ambient_noise(source, duration=1) #wait for 10 seconds
        r.pause_threshold = 0.5
        audio = r.listen(source)

    
    try:
        query = r.recognize_google(audio,language='hi') #langauge indian-english 
        #query=input()
        print(f'\nYou said: {query}\n')

    except sr.RequestError:
        print("\nSorry, I can't access the Google API...\n") 
        speak("Sorry, I can't access the Google API...\n")  


    except sr.UnknownValueError:
        print("\nSorry, Unable to recognize your speech...\n")
        speak("\nSorry, Unable to recognize your speech...")
        query = None 

    return query.lower()



def trans():
    speak('tell me the sentence to translate hindi to english')
    line=takehindi()
    a=Translator()
    b=a.translate(line)
    c=b.text
    speak(f'the translation of {line} is {c}')




def tellDay():
    day = datetime.datetime.today().weekday()+1

    day_dict = {1: 'Monday', 2: 'Tuesday', 3: 'Wednesday',
                4: 'Thursday', 5: 'Friday', 6: 'Saturday',
                7: 'Sunday'}

    if day in day_dict.keys():
        day_of_the_week = day_dict[day]
        print('\n',day_of_the_week)
        speak("The day is " + day_of_the_week)




def time1():
    strTime=datetime.datetime.now().strftime("%H:%M:%S")
    print(f"\nthe time is {strTime}\n")
    speak('the time is '+strTime)




def wait():
    print('for how much time should i wait') 
    speak('for how much time should i wait') 
    a=takeCommand()
    a=(wordtodigits.convert(a)).lower() # converting the word into digits and then coverting the text into lower
    print(a)
    b=[int(i) for i in a.split() if i.isdigit()]  #taking the digits from the string into list

    if 'second' in a or 'seconds' in a:
        if b[0]==1:
            print(f'\nAlright...{MASTER} waiting for {b[0]} second\n')
            speak(f'Alright...{MASTER} waiting for {b[0]} second')
            time.sleep(b[0])

        else:
            print(f'\nAlright...{MASTER} waiting for {b[0]} seconds\n')
            speak(f'Alright...{MASTER} waiting for {b[0]} seconds')
            time.sleep(b[0])

    elif 'minute' in a or 'minutes' in a:
        c=b[0]*60
        if b[0]==1:
            print(f'\nAlright...{MASTER} waiting for {b[0]} minute\n')
            speak(f'Alright...{MASTER} waiting for {b[0]} minute')
            time.sleep(c)

        else:
            print(f'\nAlright...{MASTER} waiting for {b[0]} minutes\n')
            speak(f'Alright...{MASTER} waiting for {b[0]} minutes')
            time.sleep(c)

    elif 'hour' in a or 'hours' in a:
        c=b[0]*60*60
        if b[0]==1:
            print(f'\nAlright...{MASTER} waiting for {b[0]} hour\n')
            speak(f'Alright...{MASTER} waiting for {b[0]} hour')
            time.sleep(c)

        else:
            print(f'\nAlright...{MASTER} waiting for {b[0]} hours\n')
            speak(f'Alright...{MASTER} waiting for {b[0]} hours')
            time.sleep(c) 




def temp(k):
        url =f"https://google.com/search?q={k}"
        r=requests.get(url)
        data=BeautifulSoup(r.text,'html.parser') #webscrapping
        t=data.find('div',class_='BNeawe').text
        speak(f'the temperature is: {t}')



def play():
    speak(f'sir! please select the folder')
    try:
        os.startfile('D:\\')
        folder=takeCommand()
        os.startfile('D:\\'+folder)
        speak('tell me the name of song or video')
        name=takeCommand()
        os.startfile('D:\\'+folder+'name'+'.mp4')
    except:
        speak('i think the file does not exist, but dont worry sir, i m at your service')
        pywhatkit.playonyt(name) #play on youtube
        speak('your requirement has been started! , enjoy sir')



def whatsapp():
    speak('tell me the name of a person')
    name=takeCommand()
    if 'sneha' in name.lower():
        speak('tell me the message!')
        msg=takeCommand()
        speak('tell the time sir!')
        speak('time in hours!')
        hour=int(takeCommand())
        speak('time in minute')
        min=int(takeCommand())
        pywhatkit.sendwhatmsg('+91 7827581279',msg,hour,min)
        keyboard.press(Key.enter)
        keyboard.release(Key.enter)
        speak(f'ok! sir sending message to {name}')

    elif 'shweta' in name.lower():
        speak('tell me the message!')
        msg=takeCommand()
        speak('tell the time sir!')
        speak('time in hours!')
        hour=int(takeCommand())
        speak('time in minute')
        min=int(takeCommand())
        pywhatkit.sendwhatmsg('+91 7042236880',msg,hour,min)
        keyboard.press(Key.enter)
        keyboard.release(Key.enter)
        speak(f'ok! sir sending message to {name}')

    elif 'mom' in name.lower() or 'maugham' in name.lower() or 'mother' in name.lower(): 
        speak('tell me the message!')
        msg=takeCommand()
        speak('tell the time sir!')
        speak('time in hours!')
        hour=int(takeCommand())
        speak('time in minute')
        min=int(takeCommand())
        pywhatkit.sendwhatmsg('+91 9350681005',msg,hour,min)
        keyboard.press(Key.enter)
        keyboard.release(Key.enter)
        speak(f'ok! sir sending message to {name}')   

    else:
        speak('sir,i think the name is not in your contact list, please tell me the phone number of that person')
        num=takeCommand()
        speak('tell me the message!')
        msg=takeCommand()
        speak('tell the time sir!')
        speak('time in hours!')
        hour=int(takeCommand())
        speak('time in minute')
        min=int(takeCommand())
        pywhatkit.sendwhatmsg(f'+91 {num}',msg,hour,min)
        #keyboard.press(Key.enter)
       # keyboard.release(Key.enter)
        speak('ok! sir sending whatsapp message!')



def screenshot():
    speak('ok sir! what should i name that file?')
    p=takeCommand()
    path=p+'.png'
    path1='D:\\projects\\desktop assistant version 1.0\\screenshots taken by shrey\\'+path
    a=pyautogui.screenshot()
    a.save(path1)
    os.startfile(path1)
    speak('here is your screenshot, sir')



def openapps(query):

    speak('okay sir, wait a second!')

    if 'open anydesk' in query.lower() or 'open any desk' in query.lower():
        speak('opening aydesk')
        os.startfile("C:\\Program Files (x86)\\AnyDesk\\AnyDesk.exe")

    elif 'open code block' in query.lower():
        speak('opening codeblocks')
        os.startfile("C:\\Program Files (x86)\\CodeBlocks\\codeblocks.exe")  

    elif 'open git' in query.lower() or 'open gitbash' in query.lower():
        speak('opening gitbash')
        os.startfile("C:\\Program Files\\Git\\git-bash.exe")

    elif 'open antivirus' in query.lower() or 'open guardian total security' in query.lower():
        speak('opening guardian total security')
        os.startfile("D:\\guardian total security setup\\guardian installation files\\SCANNER.EXE")  

    elif 'open management studio' in query.lower() or 'open sql server' in query.lower():
        speak('opening microsoft sql server management studio')
        os.startfile("D:\\microsoft sql server\\SQL SERVER management studio installation files\\Common7\\IDE\\Ssms.exe")
        keyboard.press(Key.enter)
        keyboard.release(Key.enter)


    elif 'open virtualbox' in query.lower() or 'open virtual machine' in query.lower() or 'open vm box' in query.lower():
        speak('opening virtual box')
        os.startfile("C:\\Program Files\\Oracle\\VirtualBox\\VirtualBox.exe")  
        speak('do you want me to start the ubuntu operating system')
        a=takeCommand()
        b=['yes','sure','start','i want','please','open','okay','ubuntu','yes i want ','yes start']
        if a.lower() in b:
            os.startfile('D:\\ubuntu ISO image\\ubuntu installation files\\ubuntu 20.04') 
            keyboard.press('enter')
            speak('alright sir! opened Ubuntu Linux 20.04 LTS (Focal Fossa), enjoy sir!')

        else:
            speak('alright sir ! then what else i can do for you?')  

    elif 'open share x' in query.lower():
        speak('opening sharex')
        os.startfile('D:\\shareX\\ShareX\\ShareX.exe')  

    elif 'open vlc' in query.lower() or 'open media player' in query.lower():
        speak('opening vlc media player')
        os.startfile('D:\VLC\\vlc installation files\VLC\\vlc.exe')

    elif 'open excel' in query.lower() or 'open ms excel' in query.lower() or 'open microsoft excel' in query.lower() or 'open xl' in query.lower():
        speak('opening microsoft excel')
        os.startfile("C:\\Program Files\\Microsoft Office\\root\Office16\\EXCEL.EXE") 

    elif 'open firefox' in query.lower() or 'open mozilla firefox' in query.lower():
        speak('opening mozilla firefox')
        os.startfile("C:\\Program Files\\Mozilla Firefox\\firefox.exe")    

    elif 'open google drive' in query.lower():
        speak('opening google drive')
        os.startfile("C:\\Program Files\\Google\\Drive File Stream\\49.0.8.0\\GoogleDriveFS.exe")   

    elif 'open edge'in query.lower() or 'open microsoft edge' in query.lower() or 'open age' in query.lower():
        speak('opening microsoft edge')
        os.startfile("C:\\Program Files (x86)\\Microsoft\\Edge\\Application\\msedge.exe")  

    elif 'open notepad plus plus' in query.lower() or 'open notepad ++'in query.lower():
        speak('opening notepad ++')
        os.startfile('D:\\notepad++\\notepad++\\notepad++.exe')

    elif 'open onenote' in query.lower() or 'open one note' in query.lower() or 'open 1 note' in query.lower():
        speak('opening onenote')
        os.startfile("C:\\Program Files\\Microsoft Office\\root\\Office16\\ONENOTE.EXE")                          


    elif 'open powerpoint' in query.lower():
        speak('opening powerpoint')
        os.startfile("C:\\Program Files\\Microsoft Office\\root\\Office16\\POWERPNT.EXE")


    elif 'open qt designer' in query.lower() or 'open qtdesigner' in query.lower() or 'open cutie designer' in query.lower():
        speak('opening qt designer')
        os.startfile("D:\\QT designer setup\\designer.exe")    

    elif 'open teams' in query.lower() or 'open ms teams' in query.lower() or 'open microsoft teams' in query.lower():
        speak('opening microsoft teams')
        os.startfile('C:\\Users\\shreyansh tyagi\\AppData\\Roaming\\Microsoft\\Windows\\Start Menu\\Programs\\Microsoft Teams')


    elif 'open one drive' in query.lower()or'open 1 drive' in query.lower() or 'open onedrive' in query.lower():
        speak('opening one drive')
        os.startfile('C:\\Users\\shreyansh tyagi\\AppData\\Roaming\\Microsoft\\Windows\\Start Menu\\Programs\\OneDrive')


    elif 'open code' in query.lower() or 'open vs code' in query.lower() or 'open visual studio code' in query.lower():
        speak("that's my home...haha jokes apart")
        speak('opening visual studio code')
        os.startfile('D:\\vs code files\\Microsoft VS Code\\Code.exe')

    elif 'open telegram' in query.lower():
        speak('opening telegram')
        os.startfile('D:\\OneDrive\\Desktop\\Telegram.lnk')  

    elif 'open ms word' in query.lower() or 'open word' in query.lower() or 'open microsoft word' in query.lower():
        speak('opening microsoft word')
        os.startfile("C:\\Program Files\\Microsoft Office\\root\\Office16\\WINWORD.EXE")    


    elif 'open powershell' in query.lower() or 'open windows powershell'in query.lower():
        speak('opening windows powershell')
        os.startfile('C:\\Users\\shreyansh tyagi\\AppData\\Roaming\\Microsoft\\Windows\\Start Menu\\Programs\\Windows PowerShell\\Windows PowerShell')


    elif 'open maps' in query.lower() or 'open location' in query.lower() or 'open google maps' in query.lower():
        speak('opening the location...')
        webbrowser.open('https://www.google.co.in/maps/@28.6860746,77.448055,12.79z?hl=en&authuser=0')




def closeapps(query):

    speak('okay sir, wait a second!')

    if 'close anydesk' in query.lower() or 'close any desk' in query.lower():
        speak('closing aydesk')
        os.system("TASKKILL /F /im AnyDesk.exe")

    elif 'close code block' in query.lower():
        speak('closing codeblocks')
        os.system("TASKKILL /F /im codeblocks.exe")  

    elif 'close git' in query.lower() or 'close gitbash' in query.lower():
        speak('closing gitbash')
        os.system("TASKKILL /F /im git-bash.exe")

    elif 'close antivirus' in query.lower() or 'close guardian total security' in query.lower():
        speak('closing guardian total security')
        os.system("TASKKILL /F /im SCANNER.EXE")  

    elif 'close management studio' in query.lower() or 'close sql server' in query.lower():
        speak('closing microsoft sql server management studio')
        os.system("TASKKILL /F /im Ssms.exe")


    elif 'close virtualbox' in query.lower() or 'close virtual machine' in query.lower() or 'close vm box' in query.lower():
        speak('closing virtual box')
        os.system("TASKKILL /F /im VirtualBox.exe")  


    elif 'close share x' in query.lower():
        speak('closing sharex')
        os.system('TASKKILL /F /im ShareX.exe')  

    elif 'close vlc' in query.lower() or 'close media player' in query.lower():
        speak('closing vlc media player')
        os.system('TASKKILL /F /im vlc.exe')

    elif 'close excel' in query.lower() or 'close ms excel' in query.lower() or 'close microsoft excel' in query.lower() or 'close xl' in query.lower():
        speak('closing microsoft excel')
        os.system("TASKKILL /F /im EXCEL.EXE") 

    elif 'close firefox' in query.lower() or 'close mozilla firefox' in query.lower():
        speak('closing mozilla firefox')
        os.system("TASKKILL /F /im firefox.exe")    

    elif 'close google drive' in query.lower():
        speak('closing google drive')
        os.system("TASKKILL /F /im GoogleDriveFS.exe")   

    elif 'close edge'in query.lower() or 'close microsoft edge' in query.lower() or 'close age' in query.lower():
        speak('closing microsoft edge')
        os.system("TASKKILL /F /im msedge.exe")  

    elif 'close notepad plus plus' in query.lower() or 'close notepad ++'in query.lower():
        speak('closing notepad ++')
        os.system('TASKKILL /F /im notepad++.exe')

    elif 'close onenote' in query.lower() or 'close one note' in query.lower() or 'close 1 note' in query.lower():
        speak('closing onenote')
        os.system("TASKKILL /F /im ONENOTE.EXE")                          


    elif 'close powerpoint' in query.lower():
        speak('closing powerpoint')
        os.system("TASKKILL /F /im POWERPNT.EXE")


    elif 'close qt designer' in query.lower() or 'close qtdesigner' in query.lower() or 'close cutie designer' in query.lower():
        speak('closing qt designer')
        os.system("TASKKILL /F /im designer.exe")    

    elif 'close teams' in query.lower() or 'close ms teams' in query.lower() or 'close microsoft teams' in query.lower():
        speak('closing microsoft teams')
        os.system('TASKKILL /F /im Microsoft Teams')


    elif 'close one drive' in query.lower()or'close 1 drive' in query.lower() or 'close onedrive' in query.lower():
        speak('closing one drive')
        os.system('TASKKILL /F /im OneDrive')


    elif 'close code' in query.lower() or 'close vs code' in query.lower() or 'close visual studio code' in query.lower():
        speak('closing visual studio code')
        os.system('TASKKILL /F /im Code.exe')

    elif 'close telegram' in query.lower():
        speak('closing telegram')
        os.system('TASKKILL /F /im Telegram.lnk')  

    elif 'close ms word' in query.lower() or 'close word' in query.lower() or 'close microsoft word' in query.lower():
        speak('closing microsoft word')
        os.system("TASKKILL /F /im WINWORD.EXE")    


    elif 'close powershell' in query.lower() or 'close windows powershell'in query.lower():
        speak('closing windows powershell')
        os.system('TASKKILL /F /im Windows PowerShell')



keyboard = Controller() # to control the hotkeys

def switch_window():
    keyboard.press(Key.alt)
    keyboard.press(Key.tab)
    keyboard.release(Key.tab)
    keyboard.release(Key.alt)
    speak('window switched')



def switch_tab():
    keyboard.press(Key.ctrl)
    keyboard.press(Key.tab)
    keyboard.release(Key.tab)
    keyboard.release(Key.ctrl)
    speak('tab switched')


def close_window():
    keyboard.press(Key.ctrl)
    keyboard.press('w')
    keyboard.release('w')
    keyboard.release(Key.ctrl)
    speak('tab closed') 


def new_tab():
    keyboard.press(Key.ctrl)
    keyboard.press('t')
    keyboard.release('t')
    keyboard.release(Key.ctrl)
    speak('opened new tab')



def minimizeWindow(): 
	for i in range(2):
		keyboard.press(Key.cmd)
		keyboard.press(Key.down)
		keyboard.release(Key.down)
		keyboard.release(Key.cmd)
		time.sleep(0.05)
       


def maximizeWindow():
	keyboard.press(Key.cmd)
	keyboard.press(Key.up)
	keyboard.release(Key.up)
	keyboard.release(Key.cmd)
    
    


def moveWindow(operation):
		keyboard.press(Key.cmd)
		if "left" in operation:
			keyboard.press(Key.left)
			keyboard.release(Key.left)
		elif "right" in operation:
			keyboard.press(Key.right)
			keyboard.release(Key.right)
		elif "down" in operation:
			keyboard.press(Key.down)
			keyboard.release(Key.down)
		elif "up" in operation:
			keyboard.press(Key.up)
			keyboard.release(Key.up)
		keyboard.release(Key.cmd)




def write(text):
	#text = text[5:]
    while True:
        a=takeCommand()
        if 'stop writing' in a.lower() or 'stop' in a.lower() or 'exit' in a.lower():
            break 
        for char in a:
            keyboard.type(char)
            time.sleep(0.02)




def mute():
	for i in range(50):
		keyboard.press(Key.media_volume_down)
		keyboard.release(Key.media_volume_down)



def full():
	for i in range(50):
		keyboard.press(Key.media_volume_up)
		keyboard.release(Key.media_volume_up)



def volumeControl(text):
	if 'full' in text or 'max' in text: full()
	elif 'mute' in text or 'min' in text: mute()
	elif 'incre' in text:
		for i in range(5):
			keyboard.press(Key.media_volume_up)
			keyboard.release(Key.media_volume_up)
	elif 'decre' in text:
		for i in range(5):
			keyboard.press(Key.media_volume_down)
			keyboard.release(Key.media_volume_down)







def youtube_automate():

    speak('do you want to give me any command for the automation of youtube!')
    c=takeCommand()
    b=['yes','sure','you search','i want','please','hnn','ok','yes i want']

    while c.lower() in b:

        speak("what's your command,sir?")
        a=takeCommand()
        com=a.lower()

        if 'pause' in com:
            keyboard.press(Key.space)
            keyboard.release(Key.space)
           # keyboard.press_and_release('space bar')
            speak('video paused')

        elif 'play' in com or 'resume' in com:
            keyboard.press(Key.space)
            keyboard.release(Key.space)
            #keyboard.press_and_release('space bar')
            speak('video resumed')

        elif 'restart' in com:
            keyboard.press('0')
            keyboard.release('0')
            #keyboard.press_and_release('0')
            speak('video restarted')

        elif 'mute' in com or 'nude' in com:
            keyboard.press('m')
            keyboard.release('m')
            #keyboard.press_and_release('m')
            speak('video mute')

        elif 'unnude' in com or 'unmute' in com:
            keyboard.press('m')
            keyboard.release('m')
            #keyboard.press_and_release('m')
            speak('video mute')

        elif 'skip' in com:
            keyboard.press('l')
            keyboard.release('l')
            #keyboard.press_and_release('l')
            speak('video skiped by 5 seconds')

        elif 'back' in com:
            keyboard.press('j')
            keyboard.release('j')
            #keyboard.press_and_release('j')
            speak('video back')

        elif 'full screen' in com:
            keyboard.press('f')
            keyboard.release('f')
            #keyboard.press_and_release('f')
            speak('full screen mode activated')

        elif 'film mode' in com:
            keyboard.press('t')
            keyboard.release('t')
            #keyboard.press_and_release('t')
            speak('film mode activated')

        elif 'minimize' in com or 'minimise' in com:
            keyboard.press('i')
            keyboard.release('i')
            #keyboard.press_and_release('i')
            speak('video minimized')

        elif 'maximize' in com:
            keyboard.press('i')
            keyboard.release('i')
            #keyboard.press_and_release('i')
            speak('video maximized')

        elif 'wait' in com:
            wait() 

        elif 'switch window' in com:
            switch_window() 

        elif 'switch tab' in com:
            switch_tab()

        elif 'close' in com:
            close_window()

        elif 'new tab' in com:
            new_tab()    

        elif 'stop' in com or 'exit' in com or 'no' in com or 'no command' in com:
            speak('alright sir!')
            break    





def google_automate():


    speak('do you want to give me any command for the automation of your browser!')
    c=takeCommand()
    b=['yes','sure','you search','i want','please','hnn','ok','yes i want']

    while c.lower() in b:

        speak("what's your command,sir?")
        a=takeCommand()
        com=a.lower()
        print(com)

        if 'back page' in com:
            keyboard.press(Key.alt)
            keyboard.press(Key.left)
            keyboard.release(Key.alt)
            keyboard.release(Key.left)
            #keyboard.press_and_release('Alt + left')

        elif 'forward page' in com:
            keyboard.press(Key.alt)
            keyboard.press(Key.right)
            keyboard.release(Key.alt)
            keyboard.release(Key.right)
            #keyboard.press_and_release('Alt + right')

        elif 'zoom in' in com:
            keyboard.press(Key.ctrl)
            keyboard.press('+')
            keyboard.release(Key.ctrl)
            keyboard.release('+')
            #keyboard.press_and_release('Ctrl + ')

        elif 'zoom out' in com:
            keyboard.press(Key.ctrl)
            keyboard.press('-')
            keyboard.release(Key.ctrl)
            keyboard.release('-')
            #keyboard.press_and_release('Ctlr -')   

        elif 'set zoom to default' in com or 'zoom default' in com:
            keyboard.press(Key.ctrl)
            keyboard.press('0')
            keyboard.release(Key.ctrl)
            keyboard.release('0')
            #keyboard.press_and_release('Ctrl + 0')  

        elif 'clear browsing data' in com:
            keyboard.press(Key.ctrl)
            keyboard.press(Key.shift)
            keyboard.press(Key.delete)
            keyboard.release(Key.ctrl)
            keyboard.release(Key.shift)
            keyboard.release(Key.delete)
        

        elif 'toggle the bookmark' in com or 'toogle the book mark' or 'open book mark' in com:
            keyboard.press(Key.ctrl)
            keyboard.press(Key.shift)
            keyboard.press('B')
            keyboard.release(Key.ctrl)
            keyboard.release(Key.shift)
            keyboard.release('B')
            #keyboard.press_and_release('Ctrl + Shift + B')

        elif 'select all' in com:
            keyboard.press(Key.ctrl)
            keyboard.press('A')
            keyboard.release(Key.ctrl)
            keyboard.release('A')
            #keyboard.press_and_release('Ctrl + A')

        elif 'copy' in com:
            keyboard.press(Key.ctrl)
            keyboard.press('C')
            keyboard.release(Key.ctrl)
            keyboard.release('C')
            #keyboard.press_and_release('Ctrl + C')

        elif 'open notepad plus plus' in com.lower() or 'open notepad ++'in com.lower():
            openapps(com.lower())   

        elif 'paste' in com:
            keyboard.press(Key.ctrl)
            keyboard.press('V')
            keyboard.release(Key.ctrl)
            keyboard.release('V')
            #keyboard.press_and_release('Ctrl + V')  

        elif 'save' in com:
            keyboard.press(Key.ctrl)
            keyboard.press('S')
            keyboard.release(Key.ctrl)
            keyboard.release('S')
            #keyboard.press_and_release('Ctrl + S') 


        elif 'bookmark' in com or 'book mark' in com:
            keyboard.press(Key.ctrl)
            keyboard.press('D')
            keyboard.release(Key.ctrl)
            keyboard.release('D')
            #keyboard.press_and_release('Ctrl + D')

        elif 'open find bar' in com:
            keyboard.press(Key.ctrl)
            keyboard.press('F')
            keyboard.release(Key.ctrl)
            keyboard.release('F')
           # keyboard.press_and_release('Ctrl + F')

        elif 'open a file' in com:
            keyboard.press(Key.ctrl)
            keyboard.press('O')
            keyboard.release(Key.ctrl)
            keyboard.release('O')
            #keyboard.press_and_release('Ctrl + O')

        elif 'open bookmark' in com:
            keyboard.press(Key.ctrl)
            keyboard.press(Key.shift)
            keyboard.press('O')
            keyboard.release(Key.ctrl)
            keyboard.release(Key.shift)
            keyboard.release('O')   

        elif 'open history' in com:
            keyboard.press(Key.ctrl)
            keyboard.press('H')
            keyboard.release(Key.ctrl)
            keyboard.release('H')
            #keyboard.press_and_release('Ctrl + H')

        elif 'open download' in com:
            keyboard.press(Key.ctrl)
            keyboard.press('J')
            keyboard.release(Key.ctrl)
            keyboard.release('J')
            #keyboard.press_and_release('Ctrl + J')

        elif 'new window' in com:
            keyboard.press(Key.ctrl)
            keyboard.press('N')
            keyboard.release(Key.ctrl)
            keyboard.release('N')
            #keyboard.press_and_release('Ctrl + N')

        elif 'print page' in com or 'print this page' in com:
            keyboard.press(Key.ctrl)
            keyboard.press('P')
            keyboard.release(Key.ctrl)
            keyboard.release('P')
           # keyboard.press_and_release('Ctrl + P')

        elif 'screenshot' in com or 'snapshot' in com:
            screenshot()

        elif 'refresh the page' in com or 'reload page' in com:
            keyboard.press(Key.ctrl)
            keyboard.press('R')
            keyboard.release(Key.ctrl)
            keyboard.release('R')
            #keyboard.press_and_release('Ctrl + R')

        elif 'save page' in com:
            keyboard.press(Key.ctrl)
            keyboard.press('S')
            keyboard.release(Key.ctrl)
            keyboard.release('S')
            #keyboard.press_and_release('Ctrl + S')

        elif 'new tab' in com:
            keyboard.press(Key.ctrl)
            keyboard.press('T')
            keyboard.release(Key.ctrl)
            keyboard.release('T')
            #keyboard.press_and_release('Ctrl + T')  

        elif 'view source code' in com:
            keyboard.press(Key.ctrl)
            keyboard.press('U')
            keyboard.release(Key.ctrl)
            keyboard.release('U')
            #keyboard.press_and_release('Ctrl  + U')

        elif 'switch window' in com:
            switch_window() 

        elif 'switch tab' in com:
            switch_tab()

        elif 'close' in com:
            close_window()

        elif 'wait' in com:
            wait()    

        elif 'stop' in com or 'exit' in com or 'no' in com or 'no command' in com:
            speak('alright sir!')
            break 

        else:
            break 
        speak('done sir!')    



def dict():
    speak('dictionary activated')
    speak('tell me the problem')
    while True:
        b=takeCommand()
        if 'meaning' in b.lower():
            b=b.replace('what is the',"")
            b=b.replace('tell me the meaning of','')
            b=b.replace('meaning of','')
            b=b.replace('shrey',"")
            b=b.replace('meaning of','')    
            result=dicword.meaning(b)
            print(f'the meaning of {b} is {result}')
            speak(f'the meaning of {b} is {result}')
            

        elif 'synonyms' in b.lower():
            b=b.replace('what is the',"")
            b=b.replace('tell me the synonyms of','')
            b=b.replace('synonyms of','')
            b=b.replace('shrey',"")
            b=b.replace('synonyms of','')    
            result=dicword.synonym(b)
            print(f'the synonyms of {b} is {result}')
            speak(f'the synonyms of {b} is {result}') 
             

        elif 'antonyms' in b.lower():
            b=b.replace('what is the',"")
            b=b.replace('tell me the antonyms of','')
            b=b.replace('antonyms of','')
            b=b.replace('shrey',"")
            b=b.replace('antonyms of','')    
            result=dicword.antonym(b)
            print(f'the antonyms of {b} is {result}') 
            speak(f'the antonyms of {b} is {result}')  
             

        else:
            break      



def peedtest(query):
    import speedtest
    speak('checking speed')
    a=speedtest.Speedtest()
    downloading=a.download()
    b=int(downloading/800000)
    uploading=a.upload()
    c=int(uploading/800000) #it will gove speed in mbpt

    if 'uploading' in query.lower():
        speak(f'uploading speed is {c} mbp s')

    elif 'downloading' in query.lower():
        speak(f'downloading speed is {b} mbp s')
        
    else:
        speak(f'downloading speed is {b} mbp s and uploading speed is {c} mbp s')
        

def taskexe():
    speak("hello, I'm shrey !") 
    speak('How can i help you?')       



def task_gui():
    while True:
        query=takeCommand()
        if 'wikipedia' in query.lower():
            print('\nSearching wikipedia...'+MASTER+' \n')
            speak('Searching wikipedia...'+MASTER)
            query = query.replace('wikipedia', '')
            results = wikipedia.summary(query, sentences=3)
            print(results)
            speak(results)

        elif 'activate face mask detection' in query.lower() or 'activate face detection' in query.lower() or 'mask detection' in query.lower():
            speak('activating face mask detection functionality of desktop assistant')
            from detect_mask_video import run
            run()


        elif 'write' in query.lower() or 'right' in query.lower() or 'start writing' in query.lower() or 'start typing' in query.lower() or 'type' in query.lower():
            a='what you want me to type sir?'
            write(a)    

        elif 'talk' in query.lower() or 'chat' in query.lower():
            speak("okay! a window pop up let's do a chat")
            app = ChatApplication()
            app.run()  

        elif 'speedtest' in query.lower() or 'speed test' in query.lower():
            speak('do you want to know the downloading speed or uploading speed?')
            a=takeCommand()
            peedtest(a)
            
        elif 'you need a break' in query.lower():
            speak(f'okay {MASTER} you can call me anytime!')
            #speak('just say hey shrey or wake up shrey! ')
            break

        elif 'activate questioning mode' in query.lower():
            speak('questioning mode activated, ask me any question')
            if 'what' in query.lower() or 'how' in query.lower() or 'whom' in query.lower() or 'when' in query.lower() or 'where' in query.lower() or 'why' in query.lower() or 'who' in query.lower():

                import wikipedia as goooglescrap
                query=query.replace('shrey','')
                query=query.replace('google search','')
                query=query.replace('google scrap','')
                query=query.replace('google','')
                speak('this is what i found on web')
                pywhatkit.search(query)
                try:
                    
                    result=goooglescrap.summary(query,3)
                    print(result)
                    speak(result)

                except:
                    speak('no such data available')

            


        elif 'remember that' in query.lower():
            remembermsg=query.replace('remember that','')
            remembermsg=remembermsg.replace('shrey','')
            speak(f'you told me to remind you that {remembermsg}')
            abc=open('remind.txt','w')
            abc.write(remembermsg)
            abc.close()

        elif 'show reminder' in query.lower() or 'tell me what i told you to remind' in query.lower() :
            abc=open('remind.txt','r')
            speak('you told me to remind  that '+abc.read())   
            abc.close() 


        elif 'translate' in query.lower():
            trans()

        elif 'volume' in query.lower() or 'increase volume' in query.lower():
            volumeControl(query.lower()) 
            speak('done sir!')

        elif 'minimize window' in query.lower():
            minimizeWindow()
            speak('window minimized')

        elif 'maximize window' in query.lower():
            maximizeWindow()
            speak('window maximized')

        elif 'move window' in query.lower():
            speak('where you want to move the window (right,left,up,down)?')
            a=takeCommand()
            moveWindow(a)
            speak('window moved')   


        elif 'video downloader' in query.lower() or 'download video' in query.lower() or 'download youtube video' in query.lower():
            root=Tk()
            root.geometry('500x300')
            root.resizable(0,0)
            root.title('youtube video downloader')
            speak('enter the link')
            Label(root,text='youtube video downloader',font='arial 15 bold').pack()
            link=StringVar()
            Label(root,text='paste youtube video url here ',font='arial 10 bold').place(x=140,y=40)
            Entry(root,width=70,textvariable=link).place(x=32,y=90)
            def videodownload():
                url=YouTube(str(link.get()))
                video=url.streams.first()
                video.download()
                Label(root,text='Downloaded',font='arial 15').place(x=180,y=210)
            Button(root,text='download',font='arial 15 bold',bg='pale violet red',padx=2,command=videodownload).place(x=180,y=150)
            root.mainloop()    
            speak('video downloaded')



        elif 'dictionary' in query.lower():
            dict()    

        elif 'my location' in query.lower():
            speak(f'{MASTER} your location is ')
            webbrowser.open('https://goo.gl/maps/rhPHTX88BwQMbSzn8')    

        elif 'joke' in query.lower():
            a=pyjokes.get_joke()
            speak(a)  
            print(a)    

        elif 'mute' in query.lower() or 'mute volume' in query.lower():
            mute() 
            speak('done sir!')  

        elif 'full' in query.lower() or 'full volume' in query.lower():
            full()
            speak('done sir!')     

        elif 'copy' in query.lower():
            keyboard.press(Key.ctrl)
            keyboard.press('c')
            keyboard.release(Key.ctrl)
            keyboard.release('c')
            speak('done sir!')


        elif 'paste' in query.lower():
            keyboard.press(Key.ctrl)
            keyboard.press('v')
            keyboard.release(Key.ctrl)
            keyboard.release('v')
            #keyboard.press_and_release('ctrl + v') 
            speak('done sir!') 

        elif 'save' in query.lower():
            keyboard.press(Key.ctrl)
            keyboard.press('s')
            keyboard.release(Key.ctrl)
            keyboard.release('s')
            #keyboard.press_and_release('ctrl + s') 
            speak('ok sir! what should i name that file?')
            p=takeCommand()
            for char in p:
                keyboard.type(char)
                time.sleep(0.02)
            keyboard.press(Key.enter)
            keyboard.release(Key.enter)
            speak(f'{p} file saved on desktop')
            keyboard.press(Key.cmd)
            keyboard.press('d')
            keyboard.release(Key.cmd)
            keyboard.release('d')
             

        elif 'type' in query.lower() or 'write' in query.lower():
            speak('what do you want me to type?')
            operation=takeCommand() 
            write(operation)
            speak('done sir!')   

        elif 'enter' in query.lower() or 'hit enter' in query.lower():
            keyboard.press(Key.enter)
            keyboard.release(Key.enter)
            speak('done sir!')


        elif 'open file explorer' in query.lower() or 'file manager' in query.lower():
            keyboard.press(Key.cmd)
            keyboard.press('e')
            keyboard.release(Key.cmd)
            keyboard.release('e')
            #keyboard.press_and_release('win + e')
           # keyboard.press_and_release('cmd + e')


        elif 'switch window' in query.lower():
            switch_window() 


        elif 'close tab' in query.lower():
            close_window()


        elif 'new tab' in query.lower():
            new_tab()     


        elif 'switch tab' in query.lower():
            switch_tab()


        elif 'close google drive' in query.lower():
            closeapps(query.lower())


        elif 'close edge'in query.lower() or 'close microsoft edge' in query.lower() or 'close age' in query.lower():
              closeapps(query.lower())


        elif 'close notepad plus plus' in query.lower() or 'close notepad ++'in query.lower():
            closeapps(query.lower())


        elif 'close onenote' in query.lower() or 'close one note' in query.lower() or 'close 1 note' in query.lower():
            closeapps(query.lower())                         


        elif 'close powerpoint' in query.lower():
            closeapps(query.lower())


        elif 'close qt designer' in query.lower() or 'close qtdesigner' in query.lower() or 'close cutie designer' in query.lower():
            closeapps(query.lower())   

        elif 'close teams' in query.lower() or 'close ms teams' in query.lower() or 'close microsoft teams' in query.lower():
            closeapps(query.lower())


        elif 'close one drive' in query.lower()or'close 1 drive' in query.lower() or 'close onedrive' in query.lower():
            closeapps(query.lower())


        elif 'close code' in query.lower() or 'close vs code' in query.lower() or 'close visual studio code' in query.lower():
            closeapps(query.lower())

        elif 'close telegram' in query.lower():
            closeapps(query.lower())  

        elif 'close ms word' in query.lower() or 'close word' in query.lower() or 'close microsoft word' in query.lower():
            closeapps(query.lower())    


        elif 'close powershell' in query.lower() or 'close windows powershell'in query.lower():
            closeapps(query.lower())


        elif 'close firefox' in query.lower() or 'close mozilla firefox' in query.lower():
            closeapps(query.lower())            

        elif 'close excel' in query.lower() or 'close ms excel' in query.lower() or 'close microsoft excel' in query.lower() or 'close xl' in query.lower():
            closeapps(query.lower())    

        elif 'close vlc' in query.lower() or 'close media player' in query.lower():
            closeapps(query.lower())    

        elif 'close share x' in query.lower():
            closeapps(query.lower())    

        elif 'close virtualbox' in query.lower() or 'close virtual machine' in query.lower() or 'close vm box' in query.lower():
            closeapps(query.lower())


        elif 'close management studio' in query.lower() or 'close sql server' in query.lower():
            closeapps(query.lower())    

        elif 'close antivirus' in query.lower() or 'close guardian total security' in query.lower():
             closeapps(query.lower())   

        elif 'close git' in query.lower() or 'close gitbash' in query.lower():
            closeapps(query.lower())    

        elif 'close antivirus' in query.lower() or 'close guardian total security' in query.lower():
             closeapps(query.lower())

        elif 'close any desk' in query.lower() or 'close anydesk' in query.lower():
            closeapps(query.lower())

        elif 'close code block' in query.lower():
            closeapps(query.lower())        

        elif 'open maps' in query.lower() or 'open location' in query.lower() or 'open google maps' in query.lower():
            openapps(query.lower())    

        elif 'open powershell' in query.lower() or 'open windows powershell'in query.lower():
            openapps(query.lower())    

        elif 'open ms word' in query.lower() or 'open word' in query.lower() or 'open microsoft word' in query.lower():
            openapps(query.lower())

        elif 'open telegram' in query.lower():
            openapps(query.lower())

        elif 'open code' in query.lower() or 'open vs code' in query.lower() or 'open visual studio code' in query.lower():
            openapps(query.lower())

        elif 'open one drive' in query.lower()or'open 1 drive' in query.lower() or 'open onedrive' in query.lower():
            openapps(query.lower())


        elif 'open teams' in query.lower() or 'open ms teams' in query.lower() or 'open microsoft teams' in query.lower():
            openapps(query.lower())

        elif 'open qt designer' in query.lower() or 'open qtdesigner' in query.lower() or 'open cutie designer' in query.lower():
            openapps(query.lower())

        elif 'open powerpoint' in query.lower():
            openapps(query.lower())


        elif 'open onenote' in query.lower() or 'open one note' in query.lower() or 'open 1 note' in query.lower():
            openapps(query.lower())    

        elif 'open notepad plus plus' in query.lower() or 'open notepad ++'in query.lower() or 'notepad' in query.lower():
            openapps(query.lower())    

        elif 'open edge' in query.lower() or 'open microsoft edge' in query.lower() or 'open age' in query.lower():
            openapps(query.lower())    

        elif 'open google drive' in query.lower():
            openapps(query.lower())    

        elif 'open firefox' in query.lower() or 'open mozilla firefox' in query.lower():
            openapps(query.lower())    

        elif 'open excel' in query.lower() or 'open ms excel' in query.lower() or 'open microsoft excel' in query.lower() or 'open xl' in query.lower():
            openapps(query.lower())   


        elif 'open vlc' in query.lower() or 'open media player' in query.lower():
            openapps(query.lower())    

        elif 'open share x' in query.lower():
            openapps(query.lower())

        elif 'open virtualbox' in query.lower() or 'open virtual machine' in query.lower() or 'open vm box' in query.lower():
            openapps(query.lower())   

        elif 'open management studio' in query.lower() or 'open sql server' in query.lower():
            openapps(query.lower())    


        elif 'open antivirus' in query.lower() or 'open guardian total security' in query.lower():
            openapps(query.lower())


        elif 'open anydesk' in query.lower() or 'open any desk' in query.lower():
            openapps(query.lower())


        elif 'open code block' in query.lower():
            openapps(query.lower())


        elif 'open git' in query.lower() or 'open gitbash' in query.lower():
            openapps(query.lower())


        elif 'send whatsapp' in query.lower() or 'send whatsapp mesaage' in query.lower() or 'message' in query.lower():
            whatsapp()    

        elif 'screenshot' in query.lower():
            screenshot()

        elif 'play music' in query.lower() or 'play video' in query.lower():
            play()


        elif 'hello' in query.lower() or 'hi' in query.lower() or 'hey' in query.lower():
            speak(f'\nhello {MASTER}, how are you?\n')

        elif 'fine' in query.lower() or 'good' in query.lower():
            if 'good' in query.lower():
                speak('\ngood to know that you are good')

            elif 'fine' in query.lower():
                speak('good to know that you are fine')  

            else:
                speak('good to know, sir')           

        elif 'youtube' in query.lower():
            print(f'\n{MASTER} do you want me to search on youtube?\n')
            speak(f'{MASTER} do you want me to search on youtube?')
            c=takeCommand()
            b=['yes','sure','you search','i want','please','hnn','ok']

            if c.lower() in b:
                print("\nWhat do you want me to search for?\n")
                speak("What do you want me to search for?")
                k=takeCommand()

                if k != '':     # if "k" is not empty
                    url = "https://www.youtube.com/results?search_query="+k
                    print("\nHere are the search results for " + k+' \n')
                    speak("Here are the search results for " + k)
                    #webbrowser.open(url)
                    pywhatkit.playonyt(k)
                    youtube_automate()

                while(True):
                    print(f'\n{MASTER} do you want anything else to search on youtube?\n')
                    speak(f'{MASTER} do you want anything else to search on youtube?')
                    a=takeCommand()

                    if 'yes' in a.lower() or 'yeah' in a.lower() or 'sure' in a.lower():
                        print(f'\nAlright! {MASTER} what else you want me to search for?\n')
                        speak(f'Alright! {MASTER} what else you want me to search for?')
                        b=takeCommand()

                        if b!='':
                            url1 = "https://www.youtube.com/results?search_query="+b
                            print("\nHere are the search results for " + b+' \n')
                            speak("Here are the search results for " + b)
                            #webbrowser.open(url1)
                            pywhatkit.playonyt(b)
                            youtube_automate()

                        elif 'wait' in b.lower():
                            wait() 

                        elif 'switch window' in b.lower():
                            switch_window() 

                        elif 'switch tab' in b.lower():
                            switch_tab()

                        elif 'close' in b.lower():
                            close_window()

                        elif 'new tab' in b.lower():
                            new_tab()   

                    elif 'no' in a.lower() or 'nope' in a.lower() or 'leave' in a.lower() :
                        print(f'\nAlright! {MASTER} then what else i can do for you\n')
                        speak(f'Alright! {MASTER} then what else i can do for you')
                        break

                    elif 'wait' in a.lower():
                        wait()

                    else:
                        break

            elif 'no' in c.lower() or 'nope' in c.lower() or 'leave' in c.lower():
                print('\nAlright! just opening youtube...'+MASTER+' \n')
                speak('Alright! just opening youtube...'+MASTER)
                url = 'youtube.com'
                chrome_path = 'C:/Program Files/Google/Chrome/Application/chrome.exe %s'
                webbrowser.get(chrome_path).open(url)


        elif 'google' in query.lower():
            print(f'\n{MASTER} do you want me to search on google?\n')
            speak(f'{MASTER} do you want me to search on google?')
            c=takeCommand()
            b=['yes','sure','you search','i want','please','hnn','ok']
            if c.lower() in b:
                print("\nWhat do you want me to search for?\n")
                speak("What do you want me to search for?")
                k=takeCommand()

                if k != '':     # if "k" is not empty
                    url ="https://google.com/search?q="+k
                    print("\nHere are the search results for " + k+' \n')
                    speak("Here are the search results for " + k)
                    webbrowser.open(url)
                    google_automate()

                while(True):
                    print(f'\n{MASTER} do you want anything else to search on google?\n')
                    speak(f'{MASTER} do you want anything else to search on google?')
                    a=takeCommand()

                    if 'yes' in a.lower() or 'yeah' in a.lower() or 'sure' in a.lower():
                        print(f'\nAlright! {MASTER} what else you want me to search for?\n')
                        speak(f'Alright! {MASTER} what else you want me to search for?')
                        b=takeCommand()

                        if b!='':
                            url1 ="https://google.com/search?q="+k
                            print("\nHere are the search results for " + b+' \n')
                            speak("Here are the search results for " + b)
                            webbrowser.open(url1)
                            google_automate()

                        elif 'wait' in b.lower():
                            wait()    

                    elif 'no' in a.lower() or 'nope' in a.lower() or 'sure' in a.lower():
                        print(f'\nAlright! {MASTER} then what else i can do for you\n')
                        speak(f'Alright! {MASTER} then what else i can do for you')
                        break

                    elif 'wait' in a.lower():
                        wait()

                    else:
                        break

            elif 'no' in c.lower() or 'nope' in c.lower() or 'leave' in c.lower(): 
                print('\nopening google...'+MASTER+' \n')       
                speak('Alright! just opening google...'+MASTER)
                url = 'google.com'
                chrome_path = 'C:/Program Files/Google/Chrome/Application/chrome.exe %s'
                webbrowser.get(chrome_path).open(url)

        elif 'open stackoverflow' in query.lower():
            print('\nopening stackoverflow...'+MASTER+' \n')
            speak('opening stackoverflow...'+MASTER)
            url = 'stackoverflow.com'
            chrome_path = 'C:/Program Files/Google/Chrome/Application/chrome.exe %s'
            webbrowser.get(chrome_path).open(url)

        elif 'open reddit' in query.lower():
            print('\nopening reddit...'+MASTER+' \n')
            speak('opening reddit...'+MASTER)
            url = 'reddit.com'
            chrome_path = 'C:/Program Files/Google/Chrome/Application/chrome.exe %s'
            webbrowser.get(chrome_path).open(url)

        elif 'open facebook' in query.lower():
            print('\nopening facebook...'+MASTER+' \n')
            speak('opening facebook...'+MASTER)
            url = 'facebook.com'
            chrome_path = 'C:/Program Files/Google/Chrome/Application/chrome.exe %s'
            webbrowser.get(chrome_path).open(url)

        elif 'open twitter' in query.lower():
            print('\nopening twitter...'+MASTER+' \n')
            speak('opening twitter...'+MASTER)
            url = 'twitter.com'
            chrome_path = 'C:/Program Files/Google/Chrome/Application/chrome.exe %s'
            webbrowser.get(chrome_path).open(url)

        elif 'open instagram' in query.lower():
            print('\nopening instagram...'+MASTER+' \n')
            speak('opening instagram...'+MASTER)
            url = 'instagram.com'
            chrome_path = 'C:/Program Files/Google/Chrome/Application/chrome.exe %s'
            webbrowser.get(chrome_path).open(url)

        elif 'leetcode' in query.lower():
            print('\nopening leetcode...'+MASTER+' \n')
            speak('opening leetcode...'+MASTER)
            url='https://leetcode.com/sunnytyagi886/'
            webbrowser.open(url)


        elif 'open my github' in query.lower() or 'open my getup' in query.lower():
            print('\nopening your github account...'+MASTER+' \n')
            speak('opening your github account...'+MASTER)
            url = 'https://github.com/shreyansh-tyagi'
            chrome_path = 'C:/Program Files/Google/Chrome/Application/chrome.exe %s'
            webbrowser.get(chrome_path).open(url)

        elif 'open github' in query.lower():
            print('\nopening github...'+MASTER+' \n')
            speak('opening github...'+MASTER)
            url = 'github.com'
            chrome_path = 'C:/Program Files/Google/Chrome/Application/chrome.exe %s'
            webbrowser.get(chrome_path).open(url)

        elif 'open my hackerrank' in query.lower():
            print('\nopening your hackerrank account...'+MASTER+' \n')
            speak('opening your hackerrank account...'+MASTER)
            url = 'https://www.hackerrank.com/shreyansh_tyagi?hr_r=1'
            chrome_path = 'C:/Program Files/Google/Chrome/Application/chrome.exe %s'
            webbrowser.get(chrome_path).open(url)

        elif 'open hackerrank' in query.lower():
            print('\nopening hacker rank...'+MASTER+' \n')
            speak('opening hacker rank...'+MASTER)
            url = 'hackerrank.com'
            chrome_path = 'C:/Program Files/Google/Chrome/Application/chrome.exe %s'
            webbrowser.get(chrome_path).open(url)

        elif 'open sololearn' in query.lower():
            print('\nopening sololearn...'+MASTER+' \n')
            speak('opening sololearn...'+MASTER)
            url = 'https://www.sololearn.com/profile/20214219'
            chrome_path = 'C:/Program Files/Google/Chrome/Application/chrome.exe %s'
            webbrowser.get(chrome_path).open(url)

        elif 'open my linkedin' in query.lower() or 'linkedin' in query.lower():
            print('\nopening your linkedin profile....'+MASTER+' \n') 
            speak('opening your linkedin profile....'+MASTER)   
            url='https://www.linkedin.com/in/shreyansh-tyagi-8577111a1/' 
            chrome_path='C:/Program Files/Google/Chrome/Application/chrome.exe %s'
            webbrowser.get(chrome_path).open(url)

        elif 'open my resume' in query.lower():
            speak('opening your resume')
            os.startfile('D:\\important files(pdf)\\resume\\Shreyansh Tyagi resume.pdf')


        elif 'time' in query.lower():
            time1()

        elif 'date' in query.lower():
            strdate=datetime.datetime.now().strftime("%d %b %y") 
            print(f'\nthe date is {strdate}\n') 
            speak('the date is '+strdate)


        elif 'day' in query.lower():
            tellDay()     

        elif 'name' in query.lower():

            print('\nmy name is shrey...i am ready to help\n')
            speak('my name is shrey...i am ready to help')

        elif 'who are you' in query.lower() or 'introduce yourself' in query.lower():

            print('\ni am personal desktop assistant of mister' +MASTER+ 'who made me to help him out for completing his tasks\n') 

            speak('i am personal desktop assistant of mister' +MASTER+ 'who made me to help him out for completing his tasks') 


        elif 'how are you' in query.lower():
            print('\ni am fine....\n')
            speak('i am fine....'+MASTER)


        elif 'what can you do' in query.lower() or 'capablity' in query.lower():

            print('\ni am an application program that understands natural language voice commands and completes \
            tasks for my user.\n')


            speak('i am an application program that understands natural language voice commands and completes \
            tasks for my user.')


        elif 'job' in query.lower() or 'yourself' in query.lower():

            print('\ni can perform simple jobs for my users, such as adding tasks to a calendar, \
                providing information that would normally be searched in a web browser, \
                and receive phone calls, create text messages, get directions, hear news and weather reports, \
                hear music, or play games.\n')  


            speak('i can perform simple jobs for my users, such as adding tasks to a calendar, \
                providing information that would normally be searched in a web browser, \
                and receive phone calls, create text messages, get directions, hear news and weather reports, \
                hear music, or play games.') 


        elif 'nice' in query.lower() or 'good' in query.lower() or 'great' in query.lower():
            print('\nthank you....'+MASTER+' \n')  
            speak('ohh....thankyou '+MASTER)    


        elif 'search' in query.lower():
            print("\nWhat do you want me to search for?\n")
            speak("What do you want me to search for?")
            k=takeCommand()

            if k != '':     # if "k" is not empty
                url = "https://google.com/search?q="+k
                print("\nHere are the search results for " + k+' \n')
                speak("Here are the search results for " + k)
                webbrowser.open(url)
                google_automate()

                while(True):
                    print(f'\n{MASTER} do you want anything else to search?\n')
                    speak(f'{MASTER} do you want anything else to search?')
                    a=takeCommand()

                    if 'yes' in a.lower() or 'yeah' in a.lower() or 'sure' in a.lower():
                        print(f'\nAlright {MASTER} what else you want me to search for?\n')
                        speak(f'Alright {MASTER} what else you want me to search for?')
                        b=takeCommand()

                        if b!='':
                            url1 = "https://google.com/search?q="+b
                            print("\nHere are the search results for " + b+' \n')
                            speak("Here are the search results for " + b)
                            webbrowser.open(url1)
                            google_automate()

                        elif 'wait' in b.lower():
                            wait()

                    elif 'no' in a.lower() or 'nope' in a.lower() or 'leave' in a.lower():
                        print(f'\nAlright! {MASTER} then what else i can do for you\n')
                        speak(f'Alright! {MASTER} then what else i can do for you')
                        break

                    elif 'wait' in a.lower():
                        wait()

                    else:
                        break

        elif 'who made you' in query.lower() or 'owner' in query.lower():
            print(MASTER+'Tyagi')
            speak(MASTER+'Tyagi') 
            print(f'\ndo you want to know more about {MASTER}?\n')
            speak(f'do you want to know more about {MASTER}?')
            c=takeCommand()

            if 'yes' in c.lower() or 'sure' in c.lower() or 'yeah' in c.lower():

                print(f'\n{MASTER} is a MCA student from KIET group of institutions, who is right now developing me , he has \
                completed his BCA from CCS university , he have experience in using technologies like Python 3, \
                Numpy, Pandas, C, Data Structure in C, C++, HTML 5, CSS 3, GitHub ,Git bash \
                for version control and relational databases like my SQL, and Postgre SQL.\n')


                speak(f'{MASTER} is a MCA student from KIET group of institutions, who is right now developing me , he has \
                completed his BCA from CCS university , he have experience in using technologies like Python 3, \
                Numpy, Pandas, C, Data Structure in C, C++, HTML 5, CSS 3, GitHub ,Git bash \
                for version control and relational databases like my SQL, and Postgre SQL.')

                print(f"\nTo know more about {MASTER} check it out his github, hackerrank, linkedin profiles\n")
                speak(f"to know more about {MASTER} check it out his github, hackerrank, linkedin profiles")
                url='https://github.com/shreyansh-tyagi'
                url1='https://www.hackerrank.com/shreyansh_tyagi?hr_r=1'
                url2='https://www.linkedin.com/in/shreyansh-tyagi-8577111a1/'
                url3='https://leetcode.com/sunnytyagi886/'
                url4='https://lnkd.in/gz7D5DXE'
                webbrowser.open(url)
                webbrowser.open(url1)
                webbrowser.open(url2)
                webbrowser.open(url3)
                webbrowser.open(url4)

            elif 'no' in c.lower() or 'nope' in c.lower() or 'leave' in c.lower():
                print(f'\nAlright! then what else i can do for you\n') 
                speak(f'Alright! then what else i can do for you')  

            else:
                print('\nunable to understand your voice\n')
                speak('unable to understand your voice')    

        elif 'open my portfolio' in query.lower():
            speak(f'here is your portfolio {MASTER}')
            url4='https://lnkd.in/gz7D5DXE'
            webbrowser.open(url)

        elif f'introduce {MASTER}' in query.lower() or f'who is {MASTER}' in query.lower() or 'introduce' in query.lower():

            print(f'\n{MASTER} is a MCA student from KIET group of institutions, who is right now developing me , he has \
                completed his BCA from CCS university , he have experience in using technologies like Python 3, \
                Numpy, Pandas, C, Data Structure in C, C++, HTML 5, CSS 3, GitHub ,Git bash \
                for version control and relational databases like my SQL, and Postgre SQL.\n')

            speak(f'{MASTER} is a MCA student from KIET group of institutions, who is right now developing me , he has \
                completed his BCA from CCS university , he have experience in using technologies like Python 3, \
                Numpy, Pandas, C, Data Structure in C, C++, HTML 5, CSS 3, GitHub ,Git bash \
                for version control and relational databases like my SQL, and Postgre SQL.')

            print(f"\nto know more about {MASTER} check it out his github, hackerrank, linkedin profiles\n")  
            speak(f"to know more about {MASTER} check it out his github, hackerrank, linkedin profiles")
            url='https://github.com/shreyansh-tyagi'
            url1='https://www.hackerrank.com/shreyansh_tyagi?hr_r=1'
            url2='https://www.linkedin.com/in/shreyansh-tyagi-8577111a1/'
            url3='https://leetcode.com/sunnytyagi886/'
            webbrowser.open(url)
            webbrowser.open(url1)
            webbrowser.open(url2)
            webbrowser.open(url3)


        elif 'wait' in query.lower():
            wait()

        elif 'love you' in query.lower():
            b=['glad to know','love you too shreyansh','sounds good','made my day'] 
            speak(random.choice(b))   


        elif 'thanks' in query.lower() or 'thank you' in query.lower():
            b=['welcome','its okay','my pleasure',"please don't say thanks"]
            speak(random.choice(b))


        elif 'stop' in query.lower() or 'exit' in query.lower() or 'bye' in query.lower() or 'leave' in query.lower():
            print('\nokay bye, thanks for giving your time...'+MASTER+' \n')
            speak('okay bye, thanks for giving your time...'+MASTER)
            exit()


        elif 'temperature' in query.lower():
            temp(query.lower())  

        elif 'change voice' in query.lower() or 'change your voice' in query.lower() or 'switch voice':
            changeVoice(voice_id)


        else:
            print(f'\n{MASTER}, unable to understand what you are saying...trying to learn\n')
            speak(f'{MASTER}, unable to understand what you are saying...trying to learn')



#wishme()
#task_gui()

