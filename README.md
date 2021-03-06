# ![RealWorld Example App](logo.png)

> ### [Linx](https://linx.software/) solution containing real world examples (CRUD, auth, advanced patterns, etc) that adheres to the [RealWorld](https://github.com/gothinkster/realworld) spec and API.


### [Linx5 Demo](https://demo.api.linx.twenty57.net/realworld/swagger/)&nbsp;&nbsp;&nbsp;&nbsp;[Linx6 Demo](https://demolinx6.api.linx.twenty57.net/RealWorld/swagger/)&nbsp;&nbsp;&nbsp;&nbsp;[RealWorld](https://github.com/gothinkster/realworld)

This solution was created to demonstrate a fully fledged backend application built with the low-code platform **[Linx](https://linx.software/)** including CRUD operations, authentication, routing, pagination, and more.

We've gone to great lengths to adhere to the **[Linx](https://linx.software/)** community style guides & best practices.

For more information on how to this works with other frontends/backends, head over to the [RealWorld](https://github.com/gothinkster/realworld) repo.

**General functionality:**

- Authenticate users via JWT 
- CRU* users (sign up)
- CRUD Articles
- CR*D Comments on articles (no updating required)
- GET and display paginated lists of articles
- Favorite articles
- Follow other users

### Database

This implementation makes use of a MySQL database for data persistence.

### Swagger Documentation

The documentation for the API can be found [here](https://demo.api.linx.twenty57.net/realworld/swagger/).

## Installation

## Local environment
The below steps describe how to setup the sample to run on your local Linx Designer environment.

1. Download and install the Linx Designer [here](https://linx.software/server-buy2/).
1. Open the sample Solution (.lsoz) in your Linx Designer.
2. Alter the below Solution Settings:
    - `LinxIsLocalDevEnv` : `True`
3. Select the RESTHost service, right click and select __debug__. Once initialised, **start** the debugger.
4. Once the debugger has started, you are able to make requests locally to:
   ```
   https://localhost:8080/realworld
   ```


## Cloud server deployment

The below steps describe how to host this Solution on your own Linx cloud server environment.

### Register for a Linx trial server
This solution runs on a Linx cloud server instance and integrates with a hosted MySQL database.

1. Register for a Linx trial cloud server and MySQL cloud database [here](https://linx.software/server-buy2/).
2. You will receive an email containing your Linx cloud server, drive space and MySQL database credentials when your trial server has been activated.

### Run database setup scripts
The Solution uses a MySQL database to store user related credentials.
1. Run the provided setup script on your database instance.
3. Update the below Setting values in the Linx Solution (these credentials can be found in your server registration email):
   - `DatabasePassword`: Password for your db instance
   - `DatabaseServer`: Your cloud database server name i.e. `dev1db.linx.twenty57.net`.


### Deploy to your cloud server

1. Log into your cloud server instance and upload the Solution (Top Menu > Server > Upload).
3. Open the Solution's Settings and update the `LinxServerHostname` value to reflect your server instance name -  for example, if my server is `https://dev1.linx.twenty57.net` then my instance name is "dev1".
4. Click __Save__.
3. On the Solution's service dashboard page, __start__ all of the services for the Solution.   

### Update the Linx Solution's config

`DatabaseInstanceName` - Enter database instance name.

`DatabasePassword` - Enter password.

`DatabasePort` - Enter database port.

`DatabaseServer`- Enter database server.

`DatabaseUser` - Enter databse user.

`JWTExpirySeconds`- Enter expiry in seconds for token

`JWTTokenSecretSigningKey`- Any key of your own

5. Click Save.

`On the Solution's service dashboard page, start the Realworld service.`
 
6. Once the service has started, you are able to make requests using the base URL of:
   ```
   https://{your instance name}.api.linx.twenty57.net/realworld
   ```




## Contributing

For questions please ask the [Linx community](https://linx/software/community) or use the [Slack channel](https://linxsoftware.slack.com/archives/C01FLBC1XNX). 

## License

[MIT](https://github.com/linx-software/template-repo/blob/main/LICENSE.txt)



