## Running the Tests
Assuming you are in the challenge directory:
To run all the tests, you can use:
```bash
rspec spec
```

or simply:
```bash
rspec
```

To run the tests for a specific file, you can use:
``` bash
rspec spec spec/<file_name_goes_here>_spec.rb
```

If you would like RSpec to stop running the tests as soon as it executes a failing test, you can use the `--fail-fast` option with either of the above commands. This will cut down on the output and may make it easier to read.
