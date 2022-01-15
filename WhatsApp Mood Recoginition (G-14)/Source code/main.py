# # Python0
# import libraries selenium and time
import text2emotion as te
from selenium import webdriver
from time import sleep
from ml import  *
#
#
# # Create webdriver object
PATH = "C:\Program Files (x86)\chromedriver.exe"
driver = webdriver.Chrome(PATH)

# # Get the websited
driver.get("https://web.whatsapp.com/")
#print("waiting for 100ms")
# # Make Python sleep for some time
#sleep(10)
# # status-v3 status id
#print("wait period over")
#element = driver.findElement(By.id("df9d3429-f0ef-48b5-b5eb-f9d27b2deba6"));
#click on button code
# button = driver.find_element_by_id("ee51d023-7db6-4950-baf7-c34874b80976")

# element = driver.findElement(By.name("status-v3"));
#element = driver.find_element_by_xpath("//span[@data-testid='status-v3-unread'']")
# clicking on the button
#element.click()
#
# model()
# print("script ended success")
#
#
# # Obtain the number of rows in body
# # rows = 1+len(driver.find_elements_by_xpath(
# # 	"/html/body/div[3]/div[2]/div/div[1]/div/div/div/article/div[3]/div/table/tbody/tr"))
#
# # # Obtain the number of columns in table
# # cols = len(driver.find_elements_by_xpath(
# # 	"/html/body/table/tbody/tr[1]/td"))
#
# # # Print rows and columns
# # print(rows)
# # print(cols)
#
# # # Printing the table headers
# # print("Locators		 "+"			 Description")
#
# # # Printing the data of the table
# # for r in range(2, rows+1):
# # 	for p in range(1, cols+1):
#
# # 		# obtaining the text from each column of the table
# # 		value = driver.find_element_by_xpath(
# # 			"/html/body//tbody/tr["+str(r)+"]/td["+str(p)+"]").text
# # 		print(value, end='	 ')
# # 	print()
#
# # cross button of ststus page class name :_35ycQ