# Setup Docker Para Projetos Laravel

Setup inicial para projetos Laravel utilizando Docker, facilitando desenvolvimento e deploy.

Há possibilidade de escolher entre dois setups, veja as vantagens de cada um:

1. **Dockerfile + Docker Compose:**

- Multiplos containers com docker compose, permitindo o uso de multiplos serviços separados (Nginx, MySQL, Redis, etc).
- Cada serviço tem seu próprio container, o que facilita a escalabilidade e manutenção.
- Ideal para deploy em VMs como AWS, Digital Ocean, Google Cloud Platform, etc.

2. **Somente Dockerfile:**

- Um único container para o projeto, facilitando o deploy em serviços como o Fly, Render, Google Cloud Run.
- Suficiente para projetos pequenos ou médios, principalmente sem banco de dados.
- Mais simples de configurar e manter, pois está tudo no mesmo container.

## Passo a passo

- Clone Repositório

    ```sh
    git clone https://github.com/moraisz/SetupDockerLaravel
    ```

- Clone os Arquivos do Laravel

    ```sh
    git clone https://github.com/laravel/laravel.git laravel-project
    ```

- Copie os arquivos base para o seu projeto Laravel escolhendo o setup

    ```sh
    cp -rf SetupDockerLaravel/pasta_docker/* laravel-project/
    cd laravel-project/
    ```

- Crie o arquivo .env e edite

    ```sh
    cp .env.example .env
    ```

- Suba os containers do projeto

    ```sh
    docker-compose up -d
    ```

    - OBS: Caso utilize o setup com Dockerfile, o docker-compose é para facilitar o desenvolvimento local.

- Acessar o container

    ```sh
    docker-compose exec app bash
    ```

- Instalar as dependências do projeto

    ```sh
    composer install
    ```

- Gerar a key do projeto Laravel (vai automaticamente para o arquivo .env)

    ```sh
    php artisan key:generate
    ```

- Gerar o migration do banco de dados

    ```sh
    php artisan migrate
    ```

- Acessar o projeto

    [http://localhost:8080](http://localhost:8080)

