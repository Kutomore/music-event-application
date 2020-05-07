
# Music Event Application

An small application where users are able to create a Music event. There are two types of music events:
                           i. concerts - with a single Artist; ii. festivals - with two or more Artists. 

  

### Built with

- Ruby (2.6.3)

- Rails (6.0.2.2)

- PostgreSQL (10.12)

  

## Index

1. [Settings](#settings)  

1.1. [Configuring the .env](#configuring-the-env)

1.2. [Starting the project](#starting-the-project)

## Settings

1. `cp .env.example .env`  [(+)](#env-settings)

2. `Fill .env file with relevant info`  [(+)](#env-settings)

3. `rails db:create`

4. `rails db:migrate`

5. `rails db:seed`
  

[top ⇈](#settings)
  

### Configuring the `.env`

  

All repository settings can be obtained within a file named `.env` at the root of the project.

  

```

cp .env.example .env

```

  

[top ⇈](#settings)

### Starting the project

  

After the configuration is finished the project can be started like any ohter rails project
  

```

rails s

```

  

[top ⇈](#settings)

