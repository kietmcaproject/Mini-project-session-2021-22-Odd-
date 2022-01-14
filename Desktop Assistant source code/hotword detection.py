import pyttsx3  # text-to-speech conversion
import speech_recognition as sr   #convert speech to text
import os
def takeCommand():
    r = sr.Recognizer()
    with sr.Microphone(device_index=0) as source:

        print('\n\nListening..say something: \n')
        #speak('Recognizing...please speak')
        # use the default microphone as the audio source
        r.adjust_for_ambient_noise(source, duration=1) #wait for 10 seconds
        r.pause_threshold = 0.5
        audio = r.listen(source)

    
    try:
        query = r.recognize_google(audio,language='en-in') #langauge indian-english 
        query=input()
        print(f'\nYou said: {query}\n')

    except sr.RequestError:
        print("\nSorry, I can't access the Google API...\n") 
       # speak("Sorry, I can't access the Google API...\n")  


    except sr.UnknownValueError:
        print("\nSorry, Unable to recognize your speech...\n")
       # speak("\nSorry, Unable to recognize your speech...")
        query = None

    return query        

while True:
    wakeup=takeCommand()
    if 'wake up' in wakeup() or 'hey shrey' in wakeup():
        os.startfile('D:\\projects\\desktop assistant version 1.0\\shrey.py')

    else:
        print('OOps, unable to load the files')    