1. Install SigNoz application.
    > Waring: You need have the Docker/docker-compose installed

    ```
    cd deploy && ./install.sh
    ```

2. Create a user on SigNoz application

3. Install Node API dependencies
    ```
    cd app && npm install
    ```

4. Run the Node API, typing:

    ```
    cd app && npm run start
    ```

5. See the SigNoz dashboard, should be a services called Node_app (This name can be updated on file app/tracing.cjs)

<image src="./docs/services.png" alt="List of services">