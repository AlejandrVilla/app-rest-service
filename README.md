# Rest service with Spring boot and gradle

## Install de prerequisites
1. Prerequisites
- Graddle
- openjdk 17
- Docker
- az cli
2. You can install them manually or using the pre-init script
    ```
    ./pre-init.sh
    ```

## Clone this repository
- To start first clone this repository
    ```
    git clone https://github.com/AlejandrVilla/app-rest-service.git
    ```

## Build application in isolation
1. Build the project
    ```
    ./gradlew clean build
    ```
2. Run the project
    - Run the rest application with gradlew script
    ```
    ./gradlew bootRun
    ```
    - Run the application with jar file  
    ```
    java -jar builds/libs/<your-file.jar>
    ```
3. Verify the app is running in http://localhost:8080/greeting?

# Runnin the app from a container using Docker and push to Azure Container Registry
1. Build the image
    ```
    docker build --file Dockerfile2 -t <az user url>/<image name>:<tag> .
    ```
2. Run the app
    ```
    docker run -p 8080:8080 --name <container name> <az user url>/<image name>:<tag>
    ```
3. Verify the app is running in http://localhost:8080/greeting?
    - To stop the app
    ```
    docker stop <container name>
    ```
    - To delete the container
    ```
    docker rm <container name>
    ```
4. Login in Azure
    ```
    az login --use-device-code
    ```
5. Login in Azure Container Registry
    ```
    az acr login --name <ACR name>
    ```
6. Push the image in ACR
    ```
    docker push <az user url>/<image name>:<tag>
    ```
# Using scripts to automatize the process
1. Change the scripts with your own values
    - Change Resource Group name in config.sh and destroy.sh
    - Change the location in config.sh
    - Change Azure Container Registry name in config.sh and docker-build-push.sh
    - Change the image name in docker-build-push.sh
2. Run the main.sh script 
    ```
    ./main.sh
    ```
    or run each script
    ```
    ./pre-init.sh
    ./pre-build.sh
    ./config.sh
    ./docker-build-push.sh
    ./destroy.sh
    ```

# Using Github Workflow to automatize the process
1. Set a self hosted runner
2. Set your Azure credentials in Github secrets in a json format with AZURE_CREDENTIALS name
    ```json
    {
        "clientSecret":  "***",
        "subscriptionId":  "***",
        "tenantId":  "***",
        "clientId":  "***"
    }
    ```
3. Check the workflow in GHA