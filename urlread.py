from __future__ import print_function
from pylab import *
import matplotlib.pyplot as plt 
import pandas as pd
import xlwt
import urllib2
import pylab
from xlutils.copy import copy    
from xlrd import open_workbook
wiki="http://stats.espncricinfo.com/ci/engine/stats/index.html?batting_hand=1;batting_hand=2;batting_hand=3;class=2;filter=advanced;floodlit=1;floodlit=2;home_or_away=1;home_or_away=2;home_or_away=3;innings_number=1;innings_number=2;keeper=0;orderby=batted_score;result=1;result=2;result=3;result=5;size=200;template=results;tournament_type=2;tournament_type=3;tournament_type=5;type=batting;view=innings"
page=urllib2.urlopen(wiki)
from bs4 import BeautifulSoup
soup=BeautifulSoup(page)
right_table=soup.findAll('table', class_='engineTable')
a=[]
b=[]
c=[]
d=[]
for row in right_table[2].find_all('tr'):
    cells=row.findAll('td')
    if len(cells) in [13]:
        text=str(cells[0])
        text1=text.split("</a> (")[1]
        text2=text1.split(")</td>")[0]
        a.append(cells[0].find(text=True))
        b.append(cells[1].find(text=True))
        c.append(cells[10].find(text=True))
        d.append(text2)
workbookwrite=xlwt.Workbook()
sheet=workbookwrite.add_sheet('Sheet1')
sheet.write(0,0,'Player')
sheet.write(0,1,'Runs')
sheet.write(0,2,'Ground')
sheet.write(0,3,'Team')
for i in range(1,201):
    sheet.write(i,0,a[i-1])
    sheet.write(i,1,b[i-1])
    sheet.write(i,2,c[i-1])
    sheet.write(i,3,d[i-1])
workbookwrite.save('ans.xls')
for i in range(2,379):
    book_ro = open_workbook("ans.xls")
    book = copy(book_ro)
    sheet1 = book.get_sheet(0) 
    print (i)
    wiki="http://stats.espncricinfo.com/ci/engine/stats/index.html?batting_hand=1;batting_hand=2;batting_hand=3;class=2;filter=advanced;floodlit=1;floodlit=2;home_or_away=1;home_or_away=2;home_or_away=3;innings_number=1;innings_number=2;keeper=0;orderby=batted_score;page="+str(i)+";result=1;result=2;result=3;result=5;size=200;template=results;tournament_type=2;tournament_type=3;tournament_type=5;type=batting;view=innings"
    page=urllib2.urlopen(wiki)
    soup=BeautifulSoup(page)
    right_table=soup.findAll('table', class_='engineTable')
    a=[]
    b=[]
    c=[]
    d=[]
    for row in right_table[2].find_all('tr'):
        cells=row.findAll('td')
        if len(cells) in [13]:
            text=str(cells[0])
            text1=text.split("</a> (")[1]
            text2=text1.split(")</td>")[0]
            a.append(cells[0].find(text=True))
            b.append(cells[1].find(text=True))
            c.append(cells[10].find(text=True))
            d.append(text2)
    for j in range(1,201):
        sheet1.write(j+(200*(i-1)),0,a[j-1])
        sheet1.write(j+(200*(i-1)),1,b[j-1])
        sheet1.write(j+(200*(i-1)),2,c[j-1])
        sheet1.write(j+(200*(i-1)),3,d[j-1])
    book.save("ans.xls");