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
### Query logger plugin

## Deployment spec in Pearlshell

### AMI configuration

### Runtime Presto configuration

## Deployment on EVE
