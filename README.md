###### Hola! Escribí este documento en inglés más que nada por estandarización. Como no es mi lenguaje nativo, algunas partes pueden parecer escritas en un *tono* el cual no es mi intención!. Por eso dejo este disclaimer aquí, en español <3

# MarvelList
Technical Challenge for OpenBank

## Build In
- XCode 12.5
- Swift 5

## Build For
- iPhone
- iOS >= 13
- Portrait

## Installation
Project do not use Pods, so there is no need for **pod install** or similar

## Architecture
I used a simplified version of **Clean Architecture**, using **MVP** for presentation layer.  
Additional to this, a **Repository Pattern** was used in the Data Layer.  
Adding an aditional layer with datasources was considered, but since there is only one datasource, the repository was already doing this part, so datasources weren't included.

## [weak self] consideration
It could appear that I forgot to capture self as weak in some closures, but this was intentional.  
The reason is (trying) to avoid the abuse of this and don't create hard to test scenarios where is not needed.  
[Here](https://medium.com/@almalehdev/you-dont-always-need-weak-self-a778bec505ef) is some of the documentation I based on (part of it :D).  
I think (and, of course, I could be wrong) there is not scenarios on the project where self need to be captured.

## Possible improvements
- Based on the nature of the project, I omitted the use of viewModels (as in a data object, **not** in the sense of MVVM), but it could add some degree of separation of concerns.
- The solution for async images loading is functional but not optimal. I decided to not use Pods, in part to not use a huge library when I needed just a little part of it, but a Pod is surely more polished that the solution I used. 
- I used Generic classes as abstract classes, some of those methods are implemeted using FatalError. I decide to not test this and avoid the [Mother Hen Unit Test Anti-Pattern](https://www.yegor256.com/2018/12/11/unit-testing-anti-patterns.html)
