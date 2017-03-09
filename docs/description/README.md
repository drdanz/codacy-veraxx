Not properly tested patterns
----------------------------

#### L005 There should not be too many consecutive empty lines

The codacy test looks for the error immediately after the `#Info` comment line,
but the test reports the error after the 3rd empty line, therefore it is
impossible to test it.

#### F002 File names should be well-formed

The error is reported by `vera++` at line 1, therefore it is impossible to add
a test here.

#### T013 Source files should contain the copyright notice

The error is reported by `vera++` at line 1, therefore it is impossible to add
a test here.

#### T014 Source files should refer the Boost Software License

The error is reported by `vera++` at line 1, therefore it is impossible to add
a test here.

#### T015 HTML links in comments and string literals should be correct

For some unknown reason, the test looks for the warning at line x+2 instead of
x+1;


Not working patterns
--------------------

#### F001 Source files should not use the '\r' (CR) character

The file containing the '\r' character seem to be fixed when the test runs.

```
    {
      "patternId": "F001",
      "category": "CodeStyle",
      "level": "Info"
    },
```

```
  {
    "patternId": "F001",
    "title": "Source files should not use the '\r' (CR) character",
    "description": "",
    "timeToFix": 1
  },
```

```
//#Patterns: F001
// Disable T013 - Copyright
// Disable T014 - Boost Software License

//#Info: F001
int j =
1;
```
