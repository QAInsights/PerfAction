# About PerfAction
[![contributions welcome](https://img.shields.io/badge/contributions-welcome-1EAEDB)]()
[![saythanks](https://img.shields.io/badge/say-thanks-1EAEDB.svg)](https://saythanks.io/to/catch.nkn%40gmail.com)
[![](https://img.shields.io/badge/license-MIT-0a0a0a.svg?style=flat&colorA=1EAEDB)](https://qainsights.com)
[![](https://img.shields.io/badge/%E2%9D%A4-QAInsights-0a0a0a.svg?style=flat&colorA=1EAEDB)](https://qainsights.com)
[![](https://img.shields.io/badge/%E2%9D%A4-YouTube%20Channel-0a0a0a.svg?style=flat&colorA=1EAEDB)](https://www.youtube.com/user/QAInsights?sub_confirmation=1)
[![](https://img.shields.io/badge/donate-paypal-1EAEDB)](https://www.paypal.com/paypalme/NAVEENKUMARN)
[![](https://img.shields.io/badge/dev.to-Actions%20Hackathon-blue)]()

This GitHub Action helps to automate performance testing using [Apache JMeter](https://jmeter.apache.org/) and its [plugins](https://jmeter-plugins.org/).

# How to use this GitHub Action?

## Prerequisites
Following are the prerequisites for this GitHub Action:

* `test-plan-path`
  * Mandatory
  * JMeter test plan and its dependencies such as test data, plugins etc
* `args`
  * Optional
  * Additional arguments you can pass it to your test plan execution

## Usage

### Example #1 with no arguments

```
- name: JMeter Test
  uses: QAInsights/PerfAction@v1.0
  with:
    test-plan-path: ./TestPlans/T01_HomePageLoad.jmx
    args: ""
```

### Example #2 with arguments

```
- name: JMeter Test
  uses: QAInsights/PerfAction@v1.0
  with:
    test-plan-path: ./TestPlans/T01_HomePageLoad.jmx
    args: "-H my.proxy.server -P 8000"
```

## Download JMeter Test Results

By default, this GitHub Action will log the performance statistics under `result.jtl`. After the execution, it will be uploaded to the GitHub artifacts.
    
To download the JMeter results, go to your `Actions` and then click on the executed workflow, then click on `jmeter-results` link which will download the zip file.

![Download-JMeter-Results](./assets/Download-JMeter-Results.jpg)
