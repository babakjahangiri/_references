# DDL (Data Definition Language)

Here are some commands that come under DDL:

- CREATE
- ALTER
- DROP
- TRUNCATE

<br><br>

## CREATE

```
CREATE DATABASE DbNAme;

```

```
CREATE TABLE Persons (PersonID int,
                      LastName varchar(255),
                      FirstName varchar(255),
                      Address varchar(255),
                      City varchar(255)
                      );

```

### CREATE TABLE Using Another Table

```
CREATE TABLE TestTable AS
SELECT customername, contactname
FROM customers;
```

<br><br>

## CREATE INDEX

The CREATE INDEX command is used to create indexes in tables (allows duplicate values).

Indexes are used to retrieve data from the database very fast. The users cannot see the indexes, they are just used to speed up searches/queries.

The following SQL creates an index named "idx_lastname" on the "LastName" column in the "Persons" table:

```
CREATE INDEX idx_lastname
ON Persons (LastName);
```

If you want to create an index on a combination of columns, you can list the column names within the parentheses, separated by commas:

```
CREATE INDEX idx_pname
ON Persons (LastName, FirstName);
```

> <i>Note: The syntax for creating indexes varies among different databases. Therefore: Check the syntax for creating indexes in your database.</i>
