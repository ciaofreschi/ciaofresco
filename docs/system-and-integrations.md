## System analysis
The system will need to be served by a NodeJS server running NextJS. The most convenient way to run a Node server is with a Docker image that can be deployed on a serverless or orchestrated enviroment.

(Here's an example of deployment with Cloud Run)[https://github.com/vercel/next.js/tree/canary/examples/with-docker]

While NextJS supports the creation of API routes, the actual backend will be a GO server.

A nice option will be to keep the API gateway logic (authentication, authorization) into the NextJS project and have the backend care only about the logic that counts. 
This is a nice example of separation of concerns. Since the backend needs to think about business logic and can potentially serve multiple types of frontends and services, why should it know about the auth layer? 
Auth0 will be a dependency of the NextJS layer.

We can use our expertise in Typescript to write a lean API gateway. In this API gateway we could serve GraphQL or simply proxy requests to the backend that will be implemented in GO.

A scraper will be needed in order to run periodically insertion of new recipies. The scraper can be implemented as separated serverless function or as a feature of the backend.

### Future expansions
We could implement a feed builder, that will collect the best variants and best reviews of plates based on the location of the user.
Based on the people followed, the feed can show reviews, comments and variants of other users.