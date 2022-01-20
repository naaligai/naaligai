# Naaligai Development Workflow

This (\_dev) is development directory in which developers can give suggestions and
get how the project is structured and what methodology used like so.

## Technologies Used

Python 3.8.10
Django 3.2
Postgresql 12
node v14.17.0
npm 8.3.1
react 17

## Source Code Regulations

For Clean Code :

-   Use `SOLID` design principles
-   Use `12 Factor App` design

Branching strategies

-   main

    -   default branch for project
    -   maintains production code only
    -   long running branch

-   release

    -   for production release (specific version)
    -   derived from `main` branch
    -   long running branch

-   dev

    -   it is main development branch
    -   for development purpose
    -   derived from `main` branch
    -   it is also long running branch

-   doc

    -   for documentation purpose
    -   write after production code is ready
    -   derived from `main` branch
    -   long running branch

-   feature

    -   feature specific branch, name should prefixed with `feature-`
    -   derived from `dev` branch
    -   it is not a long running branch

-   hotfix
    -   temperary branch derived from `release` branch
    -   fix bugs with issue ordering like `issue-0001` branch
    -   then merge `issue-0001` to `main`, `release` and `dev` branch.
    -   after fix it delete `hotfix` branch.

## Workflow

-   Developers pull code from repository.
-   Goto `dev` branch and create new `feature` branch then work on it and test it.
-   Then merge into `dev` branch.
-   Check overall test again.
-   If it okay then merge into `main` branch.
-   Create or Goto `doc` branch from `main` branch. Then write documentation.
-   After merge it into `main` branch.
-   Create `release` branch from `main` branch.
-   Then announce release.
-   If bug occurs create `hotfix` branch from `release` branch.
-   Then fix some bugs and test it.
-   If okay, then create new `issue-0001` branch from `htofix`.
-   Merge it into `release`, `main` and `dev` branch.
-   Then delete `hotfix` branch.

## Discussion and Development Support

see `_dev/concept` for what are the business logic.
see `_dev/ux_ui` for prototype and designing ideas.
