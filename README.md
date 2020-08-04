# loancalc-espresso-runner

This repo presents an example of executing Espresso test cases on Sauce Labs Real Devices as part
of the native framework capability.

## Prerequisites

The test runner used by Sauce Labs to execute the Espresso tests is a downloadable Java jar file.  The current release is provided in this release but can also be downloaded from https://wiki.saucelabs.com/display/DOCS/Using+Espresso+for+Real+Device+Testing.

The scripts in this repo were developed on macOS and expect JDK 11 to be installed and available.

## Setup

A prebuilt native Android application and it's Espresso test cases are included in this repo.  Source to this application can be found on GitHub at https://github.com/billmeyer/LoanCalcAndroid.

The application is bundled in `LoanCalc.apk` and the tests cases are bundled in `LoanCalc-tests.apk`.

The `LoanCalc.apk` file needs to be uploaded to Sauce Labs and a "App Project" needs to be created to reference the app from our test runner.  Follow these steps to upload the APK and create an App Project:

1. Sign into Sauce Labs at https://app.saucelabs.com
2. Navigate to SAUCE APPS &rarr; Legacy RDC &rarr; + New App &rarr; Android/IOS App.
3. Follow the prompts to upload the `LoanCalc.apk` file.
4. Once created, click on the new `Car-Loan-Calculator` project.
5. Navigate to AUTOMATED TESTING &rarr; Appium &rarr; Setup Instructions.
6. Copy the value of the `testobject_api_key` and set it as an environment variable in the terminal you are executing your tests from:

    ```
    export TESTOBJECT_API_KEY='xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'
    ```

## Execution

Executing a test is simply a matter of running `run-runner.sh` and passing in the example number (1 ... 5):

```bash
$ ./run-runner.sh 1
```

## Examples

There are five examples provided starting from the most basic and moving up to more advanced approaches.  The mindset behind the progression is the desire to shard multiple tests cases across multiple devices using parallel execution to ultimately reduce the amount of time needed to execute all tests.

### Example 1 - Minimal configuration

`runner-ex1.yml` provides a minimum configuration needed to run the Espresso tests.  In this example, there are two test cases executed on a single, available device in sequential order.

### Example 2 - Run each test on it's own device

`runner-ex2.yml` breaks apart the execution of the two test cases such that they can run in parallel on separate devices that are available (ie., not in use) in the pool.

### Example 3 - Run in parallel on hard-coded devices

`runner-ex3.yml` modifies the second example by specifying which device in the pool to execute each test on.  Still uses parallel execution.

### Example 4 - Parallel execution using dynamic devices

`runner-ex4.yml` uses the `deviceNameQuery` capability to look for available devices using wildcard names.  This example demonstrates the ability to run a specified test(s) on a pool devices that are configured the same but have different names for parallel processing.

### Example 5 - Parallel execution by platform version

`runner-ex5.yml` uses only the `platformVersion` field to select an available device.  Demonstrates the ability to pick a specific version of Android from the pool of devices for executing tests in parallel.