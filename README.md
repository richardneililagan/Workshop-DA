# DevAx::academy - Monoliths to Microservices

The AWS DevAx::academy is a structured educational & enablement program for strategic AWS customers. The program helps customers build the right developer skills for cloud adoption and build developer cloud native fluency across their organisation. We do this by running a structured developer enablement program, where the DevAx team works directly with a customer's development teams for an extended period of time to upskill their internal development community with a curriculum of workshops and co-development sessions.

The live version of this workshop can be found at [http://workshops.devax.academy/monoliths-to-microservices](http://workshops.devax.academy/monoliths-to-microservices)

## Description
Monoliths to Microservices is a packaged programme for the DevAx::academy. The programme is a 7 week developer enablement programme targeted at experienced software developers who have not yet had an opportunity to gain experience on the broader AWS platfrom, or experience developing for the cloud in general. 

It is designed to take developers from the basics of what AWS is, what it can do, and how to create real-world system and application architectures and implementations on the AWS cloud. It takes a theory and pattern first approach before introducing the AWS developer tools. For example developers first learn Eventing patterns (Event Sourcing, CQRS etc) before they learn how to apply the pattern using AWS tools.

## Features
Over the 7 weeks, developers start with a Java Springboot Monolith with a large RDBMS backend, and methodically break the monolith into a series of decoupled microservices. They will rehost the application in AWS, and then refactor the application architecture to utilise application release automation, bounded context based microservices, refactoring and rearchitect the databases, implement an event driven system, implement authZ and authN, and create AI driven services. Topics like microservices security best practices are covered as a cross-cutting topic across all modules.

- Module 1 – Lift & Shift – Migrating The Monolith
- Module 2 – Application Release Automation
- Module 3 – Create a Microservice
- Module 4 – Refactor Your Database
- Module 5 – Microservices Decoupled Eventing & Messaging Architectures
- Module 6 – Creating an Authenticated Single Page App
- Module 7 – Creating Immersive AI Experiences

## Getting Started
To get started follow the instructions below:

### Installation
You will need the following to contribute and use this package:

- [Hugo](https://gohugo.io/getting-started/installing/)

### Running the Workshop Locally

```
git clone ssh://git.amazon.com/pkg/Devax-academy-wx-monolith-to-microservices
cd Devax-academy-wx-monolith-to-microservices/monoliths-to-microservices
cd workshop
hugo serve
```
