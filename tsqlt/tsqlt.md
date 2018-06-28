# tSQLt

Unit testing framework which allows us to write, execute and diagnose tests for T-SQL code.

* Tests are written in T-SQL
* Allow to execute tests in a repeatable way
* Provide a way to isolate code and tables using mocking

## Up and running

### Install

Install tSQLt execute the script ***tSQLt.class.sql***

You can download tSQLt [here]( http://tsqlt.org/download/tsqlt/).

CLR dependencies (since tSQLt includes a clr assembly):

* clr enabled
* clr strict security

### Run

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
exec  tSQLt.Run '[you_test_class]'
```