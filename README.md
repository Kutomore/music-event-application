
# Music Event Application

An small application where users are able to create a Music event. There are two types of music events:
                           i. concerts - with a single Artist; ii. festivals - with two or more Artists. 

  
### Prerequisites

- Install Docker - [See Instalation](https://docs.docker.com/install/overview/)

- Install Docker Compose - [See instalation](https://docs.docker.com/compose/install/)

### Built with

- Ruby (2.6.3)

- Rails (6.0.2.2)

- PostgreSQL (10.12)

## Index

1. [Settings](#settings)  

1.1. [Configuring the .env](#configuring-the-env)

1.2. [Starting the project](#starting-the-project)

2. [Runing commands](#run-commands)

3. [Stopping containers](#stop-and-remove-containers)

## Settings

1. `cp .env.example .env`  [(+)](#configuring-the-env)

2. `docker network create musicevent_default` 

3. `docker-compose up --build` 

4. `docker-compose run web rails db:create`

5. `docker-compose run web rails db:migrate`

6. `docker-compose run web rails db:seed`
  

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

### Run Commands

We can also run the commands inside the containers using the command `docker-compose run`, specifying a container. If I want to run as `web` the specs, for example, I can use:

```

docker-compose run web bundle exec rspec

```

  
  

[top ⇈](#working-with-containers)

### Stop and Remove Containers

  

To stop a container running in the foreground, I use `Ctrl-C`. To stop a container in the background, I drag:

  

```

docker-compose stop db web

```

  

To stop all active containers, I can run the command without arguments, as in:

  
  

```

docker-compose stop

```

  

Note, however, that the `stop` command does not remove the containers, just to execute them. If I want to get into them again, I can use the `docker-compose -f dev.yml up` command and it will start the same container where I was working. To remove containers individually, we can run:

  

```

docker-compose rm db web

```

  

And we can also remove everything with:

  

```

docker-compose down

```

  

[top ⇈](#working-with-containers)

