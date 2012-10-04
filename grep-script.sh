curl http://www.basketball-reference.com/players/a/ --output players.html
#you can use wget here too, I use curl since it's readily avail on Mac Terminal

sed -e ':a' -e 'N' -e '$!ba' -e 's/\/td>\n/<THANG>/g' players.html > temp1.html
#you can replace <THANG> with whatever tag name you like

grep '\<a href="/players/.*\<THANG\>' temp1.html > temp2.html

#==> up to here, you should get the whole table of players + their info
# if you want to take out the html tags then continue below

sed -e 's/<td align="left" >.*\.html">//g' -e 's#</a>[</strong>]*<<THANG> *<td align="right" ># || #g' -e 's#<<THANG>   <td align="right" ># || #g' -e 's#<<THANG>   <td align="center" ># || #g' -e 's#<<THANG>   <td align="left"  csk=".*<a href=.*"># || #g' -e 's#</a><<THANG>   <td align="left" ><a href=.*"># || #g' -e 's#</a><<THANG></tr>#$$#g' temp2.html > infodump.dmp
#1st pattern is for tags before name
#2nd pattern is for tags between name and from year
#3rd pattern is for tags between from year and to year
#4th pattern ------------------- to year and position
#5th --------------------------- position and Height
#6th --------------------------- Height and Weight
#7th --------------------------- Weight and Birth Date
#8th --------------------------- Birth and College





name="ControlGroupSearchView$ButtonSubmit"
