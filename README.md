# 🥕 Carrot Deployment

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](./LICENSE)

This repository contains the Docker Compose configuration files to easily deploy an instance of the [Carrot](https://github.com/Jumper-Carrot/Carrot) server application, which is required to use the [Jumper](https://github.com/Jumper-Carrot/Jumper) application.

For more information about Carrot and Jumper, please refer to the [Jumper documentation](https://carrot.jumper-app.com/).

## 🚀 Getting Started

### 📋 Prerequisites

You need a server with Docker installed.
To install Docker, you can refer to the [official documentation](https://docs.docker.com/engine/install/).

You should be able to run this command successfully:

```bash
docker compose version
```

The minimum recommended server specifications are:

  - 2 CPUs
  - 2 GB RAM
  - 20 GB disk space

### ⚙️ Installation

#### TL;DR (Quick Setup)

Run the following command on your server:

```bash
curl -fsSL https://raw.githubusercontent.com/Jumper-Carrot/Carrot-deploy/main/install.sh | bash 
cp .env.sample .env
docker compose up -d
```

---

1.  **Download the repository files to your server:**

    ```bash
    curl -fsSL https://raw.githubusercontent.com/Jumper-Carrot/Carrot-deploy/main/install.sh | bash
    ```

    > **NOTE :**
    > _Or on Windows server with PowerShell_
    >
    > ```powershell
    > iwr -useb https://raw.githubusercontent.com/Jumper-Carrot/Carrot-deploy/main/Install-CarrotDeploy.ps1 | iex
    > ```

    _This command will download the Docker Compose configuration files to your current directory._

2.  **Configure environment variables in the `.env` file:**

    ```bash
    cp .env.sample .env
    ```

    > **NOTE :**
    > _Or on Windows server with PowerShell_
    >
    > ```powershell
    > Copy-Item .env.sample .env
    > ```

3.  **(Optional) Edit the `.env` file to set your desired configuration.**

    > **IMPORTANT :**
    > If you are in a production environment, make sure to set proper values for the following variables:
    >
    >   * `SECRET_KEY`: Secret key for the application.
    >   * `SIGNING_KEY_FILE`: Path to the signing key file (for JWT Tokens).
    >   * `VERIFYING_KEY_FILE`: Path to the verifying key file (for JWT Tokens).
    >   * `POSTGRES_PASSWORD`: Password for the PostgreSQL database.

4.  **Start the services using Docker Compose:**

    ```bash
    docker compose up -d
    ```

    > **TIP :**
    > (Optional) If you want to use Traefik as a reverse proxy, you can set the `CARROT_DOMAIN` and
    > `LETSENCRYPT_EMAIL` variables and start the services with *docker-compose.traefik.yml* instead:
    >
    > ```bash
    > docker compose -f docker-compose.traefik.yml up -d
    > ```

5.  **Access the Carrot application at `http://<your-server-ip>:9890`** (or `https://<your-domain>`
    if using Traefik).

### 🔗 Connect with your Jumper app

1.  **Install the Jumper application on your machine:**

      * [Jumper for Windows](https://github.com/Jumper-Carrot/Jumper/releases/latest) (.exe)

2.  **Run the executable to install the application.**

3.  **Launch the Jumper application, and on the login page, enter the URL of your Carrot instance.**
    For example: `http://<your-server-ip>:9890` or `https://<your-domain>` if using Traefik.

    > **TIP :**
    > You can set this URL as the `JUMPER_BACKEND_URL` environment variable on users’ machines
    > to automate this step.

4.  **Log in with the default administrator credentials:**

      * Email: `admin@mail.com`
      * Password: `admin`

You are now ready to use the Jumper application connected to your Carrot server !

## ⬆️ Updating Carrot

To update your Carrot instance, you can run the installation command again:

```bash
curl -fsSL https://raw.githubusercontent.com/Jumper-Carrot/Carrot-deploy/main/install.sh | bash
```

This will download the latest Docker configuration files, and `.env.sample`.

You can then modify your `.env` file if necessary, according to the new configuration.

> [!TIP]
> Usually, updating Carrot simply involves changing the Docker image version
> via the `CARROT_IMAGE_VERSION` variable in the `.env` file. Then restart the services with:
>
> ```bash
> docker compose up -d
> ```
>
> Available Carrot versions are listed on [Docker Hub](https://hub.docker.com/r/antoinelibert/carrot/tags).

> [!IMPORTANT]
> Before restarting the services, it is recommended to back up your PostgreSQL database:
>
> ```bash
> docker exec -t carrot-postgres pg_dumpall -c -U postgres > dump_`date +%d-%m-%Y"_"%H_%M_%S`.sql
> ```

> [!NOTE]
> The Jumper application will automatically update to remain compatible with the associated Carrot version.
> You can customize this behavior via the environment variables `ALLOW_FRONTEND_UPDATES`
> and `MAX_ALLOWED_VERSION` in the `.env` file.


## 🤝 Contributing

To contribute to [Jumper](https://github.com/Jumper-Carrot/Jumper) and [Carrot](https://github.com/Jumper-Carrot/Carrot) development, please refer to the respective repositories.

For detailed guidelines on how to contribute to the Carrot Deployment project (submitting bugs, feature requests, and Pull Requests), please see the 
[CONTRIBUTING](https://github.com/Jumper-Carrot/Carrot?tab=contributing-ov-file) section.
