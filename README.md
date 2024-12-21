# Setup Docker Para Projetos Laravel

## Passo a passo

- Clone Repositório

    ```sh
    git clone https://github.com/moraisz/SetupDockerLaravel
    ```

- Clone os Arquivos do Laravel

    ```sh
    git clone https://github.com/laravel/laravel.git laravel-project
    ```

- Copie os arquivos base para o seu projeto Laravel

    ```sh
    cp -rf SetupDockerLaravel/* laravel-project/
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

- Acessar o projeto

    [http://localhost:8000](http://localhost:8000)

## Considerações

### Agradecimentos ao [especializati](https://www.youtube.com/@especializati)

Esse repositório é inspirado no [setup-docker-laravel](https://github.com/especializati/setup-docker-laravel), entretanto fiz algumas mudanças a meu gosto.
