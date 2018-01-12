# Stitch Fix customized Presto

We are using the stable version 0.167.t.0.6 from Teradata Presto. We can keep track of the upstream update to build a new stable version.

## Requirements

* <b>Java 8</b> Update 92 or higher (8u92+), 64-bit
* Maven 3.3.9+ (for building)

## Building Presto

Presto is very time consuming to compile with tests, so just skip tests.

    mvn clean install -DskipTests
    
## Additional plugins to include
### Kinesis plugin
https://github.com/stitchfix/presto-kinesis
### Query logger plugin
https://github.com/stitchfix/presto-query-logger

<b> Notice all above jars are prepared at s3://stitchfix.aa.warehouse/dw/presto/ . Plugins also need to include additional jars they depend on, just like every other Presto plugin.</b>

## Deployment spec in Pearlshell
See the README in https://github.com/stitchfix/pearlshell/tree/sf-presto-master_branch

## Deployment on EVE and further configuartion
Master: https://eve.daylight.stitchfix.com/specs/presto-master
Worker: https://eve.daylight.stitchfix.com/specs/presto-worker

Notice these two EVE specs share the same AMI image, but differ in env configuaraton. 

### Special setup for Presto workers
EVE can't handle spot instances, so we just use it to generate a template with a few on-demand instances. After that, log into AWS EC2 console and select "Auto-scaling launch configuartion" from the left bar. Find the one for Presto worker (look like presto-worker-infra-v24), click "copy launch configuration" button to create a new one. In that you can select spot instance and pick a bid price. Once this is done, go to the "Auto scaling group" on the left bar and find the actual ASG for Presto worker, change the launch configuration to the new one just created/cloned. Increase the instance number as you need, the ASG will spin up new instances under the new launch config, thus only spot instances.


