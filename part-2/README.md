# Part 2: Work with a Collection
## Summary
In this part of the assessment, we are going to be working with a collection of objects.  We've been provided three classes and tests that describe the behaviors of the classes.  Take a look at the provided code before moving on to completing this part of the assessment.

### `Sock` and `SockMatcher`
The `Sock` and `SockMatcher` classes have been written for us.  Furthermore, tests have been provided that describe the behaviors of these classes.  Read the code for these classes and the test code because we'll be working with these objects later

### `SockDrawer`
The `SockDrawer` class is somewhat complete.  We can initialize an instance of `SockDrawer` with a collection of socks and a matcher.  The challenge for this part of the assessment is to write methods that provide a `SockDrawer` instance with ways of interacting with its socks.  The desired behaviors have been described in tests:

- A sock drawer will be able to match one of its socks to a given sock.
- A sock drawer will be able to match two of its own socks.

## Running the Tests
If you have questions on how to run the tests, please check the [rspec-help](../rspec-help.md) document.

## Releases
### Release 0: `SockDrawer#supply_match_for`
Pretend we have a single sock and we need to find a match for it.  We believe that a matching sock is located in the sock drawer.  So, we're going to ask the sock drawer to give us a match for our sock.

A group of tests is provided to describe how an instance of `SockDrawer` behaves when told to supply a match for a sock.  This group of tests is [tagged](https://www.relishapp.com/rspec/rspec-core/v/2-4/docs/command-line/tag-option) `supply_match_for`.  To run the tests specific to the `#supply_match_for` method, from the root directory run:

```
rspec --tag supply_match_for
```

The three tests in the example group should be failing.  Update the `SockDrawer` class in `sock_drawer.rb` to make the tests pass.

*Do not modify the tests.*

### Release 1:  `SockDrawer#supply_random_pair_of_socks`
Now pretend we need a pair of socks.  We don't have any particular sock for the sock drawer to match.  Instead, we want the sock drawer to give us any pair of socks that it can find among its socks.

A group of tests is provided to describe how an instance of `SockDrawer` behaves when told to supply a random pair of socks.  This group of tests is [tagged](https://www.relishapp.com/rspec/rspec-core/v/2-4/docs/command-line/tag-option) `supply_random_pair_of_socks`.  To run the tests specific to the `#supply_random_pair_of_socks` method, from the root directory run:

```
rspec --tag supply_random_pair_of_socks
```

Update the `SockDrawer` class in `sock_drawer.rb` to make the tests pass.

*Do not modify the tests.*

## Conclusion
Once all the tests have passed, you have completed Part 2 of the assessment.  If you haven't done so already, commit your changes and move on to Part 3.
