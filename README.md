# codacy-vera++

Offers vera++ support for Codacy


# Developing

## Dependencies

There are no special dependencies to run this container, just `git` and `docker`
and `sbt` to run the tests should be enough.


## Executed Script

The `target/run-vera++.sh` script executed in the container is a simple shell
script that uses `jq` to parse the `/src/.codacy.json` file and calls `vera++`
with the requested parameters.

There is not much error checking.


## Testing

Test the project with

```bash
sh script/bootstrap
```
