# To-Do

* Continue making a Northwind-Like DB by adding the data to it
	* You added up to Employee data
	* Next to add is the Order Details Data

# Quick Notes

## Downloaded Northwind Sample Database

Forked from Microsoft repo, cloned locally. Doesn't look like the script runs in MySQL though. 

## Downloading the MyWind Sample Database

Created a new schema in the workbench and copied this into the script for creating it. https://github.com/dalers/mywind/blob/master/northwind.sql

I don't think this has ported the data straight in though. So next is to do that. 

Copied the contents from https://github.com/dalers/mywind/blob/master/northwind-data.sql into the "query1" tab on the workbench and executed. Has this done what we needed?

## Making a Northwind-Like DB

Built piece-wise by converting Syntax from here, https://raw.githubusercontent.com/DLeeSolar/sql-server-samples/master/samples/databases/northwind-pubs/instnwnd.sql .

Creating tables is pretty straight forward. See Syntax Changes section below for notes on that. 

Not sure if the 'CLUSTERED' is working on the PRIMARY KEYS, check this later. 

FOREIGN KEYS work by telling it which entry in this table is foreign, and then which table to reference to find the entry it's looking for.

Can also set up INDEX entries during table creation. 

Used `sed` to make the changes to the data where needed. 

When adding the first set of data for categories.
* `sed -i -- 's/INSERT/INSERT INTO/g' ./myNorthwindDataScript.sql`
* `sed -ie -- 's|["\'']|`|g' ./myNorthwindDataScript.sql`
* `sed -i -- 's/$/;/g' ./myNorthwindDataScript.sql`

When adding the later sets of data for everything else
* `sed -i -- 's/INSERT "/INSERT INTO "/g' ./myNorthwindDataScript.sql`
* `sed -ie -- 's|["\'']|`|g' ./myNorthwindDataScript.sql`
* `sed -i -- 's/GO$//g' ./myNorthwindDataScript.sql`
* `sed -i -- 's/)$/);/g' ./myNorthwindDataScript.sql`

Next block of data to add is the Order Details. You'll need to clean it again before it can be added too. 

### Testing Data Additions
* One tab for the Schema Script, re-run this each time you change the data script
* One tab for the Data Script, refresh the schemas pane on the left then re-run this script
* One tab for checking data has been added using
	```
	USE `northwind`;
	SELECT * FROM customers;
	```

### Syntax Changes

* "int" is INT
* "image" is BLOB
* "money" is DECIMAL(15,2)

## Some of The Most Important SQL Commands

* SELECT - extracts data from a database
* UPDATE - updates data in a database
* DELETE - deletes data from a database
* INSERT INTO - inserts new data into a database
* CREATE DATABASE - creates a new database
* ALTER DATABASE - modifies a database
* CREATE TABLE - creates a new table
* ALTER TABLE - modifies a table
* DROP TABLE - deletes a table
* CREATE INDEX - creates an index (search key)
* DROP INDEX - deletes an index

# Troubleshooting

## Starting / Stopping MySQL Sever

For whatever reason, attempting to start the server via the workbench fails citing `could not start server: argument 2`. The community seems to believe this is a bug. 

To start the server, run command prompt as administrator and issue `net start MySQL80` in the prompt. To later stop the server, run `net stop MySQL80`. 

Solution found here: https://stackoverflow.com/questions/66083106/trying-to-start-mysql-server-and-getting-could-not-start-server-argument-2-c
