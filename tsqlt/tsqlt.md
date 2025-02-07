# tSQLt

Unit testing framework which allows us to write, execute and diagnose tests for T-SQL code.

* Tests are written in T-SQL
* Allow to execute tests in a repeatable way
* Provide a way to isolate code and tables using mocking

## Install

Install tSQLt execute the script ***tSQLt.class.sql***

You can download tSQLt [here]( http://tsqlt.org/download/tsqlt/).

CLR dependencies (since tSQLt includes a clr assembly):

* clr enabled
* clr strict security

## What's a tSQLt test?

* Stored Procedure that starts with the word "test"
    * [test that is a good example] --> OK
    * [this a bad test example] --> NOK
* The SP must be in a schema that contains the extended property tSQLt.TestClass = 1
    * For that use "tSQLt.NewTestClass" cmd to create the test class/schema 
* Each test is wrapped in a transaction
    * Modifications are rolled back and the results saved

tSQLt tests benefits:
* Business requirements documentation
* Code refactoring
* Isolation
    * Unrelated changes do not affect other parts of the system
* Help structure code into distinct components
    * Keep it small (batches)

## Create a tSQLt test

Create a tSQLt test class:

```sql
EXEC tSQLt.NewTestClass 'my_new_test_class'
```

Create a tSQLt test case:

```sql
CREATE PROCEDURE my_new_test_class.[test something imortant]
AS
BEGIN
-------Assemble
    --This section is for code that sets up the environment

-------Act
    --  Execute the code under test like a stored procedure, function or view
    --  and capture the results in variables or tables.

-------Assert
    --  Compare the expected and actual

END;
```

## Run

Run all the tests with:

```sql
exec tSQLt.RunAll
```

Run a specific test with:

```sql
exec tSQLt.Run '[your_test_class].[your_test]'
```

Run all tests of one test class with:

```sql
exec  tSQLt.Run '[your_test_class]'
```

## What can be tested

* Stored Procedures
* Functions
* Views
* Tables
* Tables constrains that are critical

## Testing (without data)

* **Unit tests is about testing code**
    * You do not need a database full of data, you need the opposite
* **Data setup**
    * Only the necessary data for making the test work is needed
* **Mocking**
    * tSQLt.FakeTable
    * tSQLt.FakeFunction
    * tSQLt.SpyProcedure

## Isolating objects

* **tSQLt.FakeTable**
    * Fakes the original table without constrains
    * Isolate the table from constrains – I don’t need unnecessary data 
* **tSQL.FakeFunction**
    * Simply replaces the original function
    * Allow to simplify the logic
* **tSQLt.SpyProcedure**
    * Replace the original SP with a spy
    * The spy will record the parameters that were passed to it
* **tSQLt.ApplyTrigger**
    * Restores a trigger of a faked table
* **tSQLt.ApplyConstraint**
    * Enable a constraint in a faked tables
 

### FakeTable

Parameters:

* @Identity = 1
* @ComputedColumns = 1
* @Defaults = 1

## Expectations

* **tSQLt.ExpectException**
    * An error/exception is expected
* **tSQLt.ExpectException**
    * No error/exception is expected 

## Asserts

* tSQLt.AsserEquals
* tSQLr.AssertEqualsTable
* tSQLt.AssertEmptyTable
* tSQLt.AssertEqualsString
* tSQLt.AssertEqualsTableSchema
* tSQLt.AssertLike
* tSQLt.AssertNotEquals
* AssertObjectDoesNotExist
* AssertObjectExists
* AssertResultSetsHaveSameMetaData
* Fail
