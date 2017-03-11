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
