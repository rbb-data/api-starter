# api-starter

Starter to develop and deploy APIs via Google Cloud Functions

## Run locally

Make sure to specify a `FUNCTION_NAME` in `.env.cloud`.

```bash
# load environment variables from .env and .env.cloud
export $(cat .env .env.cloud | xargs)

# install and launch
npm install
npm run watch
```

Go to `http://localhost:8080/` to interact with your API. Your code lives in `index.js`. The site will be reloaded whenever `*.js` files change (specified in `package.json` under `watch`).

## Deploy (via Google Cloud Functions)

Make sure to specify a `CLOUD_PROJECT` in `.env` and connect to it:

```bash
gcloud config set project $CLOUD_PROJECT
```

Enable cloud functions for the current project:

```bash
gcloud services enable cloudfunctions.googleapis.com
```

Set the region to "Frankfurt":

```bash
gcloud config set functions/region europe-west3
```

To deploy, run:

```bash
npm run deploy
```

> **Note**
>
> Environment variables defined in `env.cloud` need to be known by the cloud environment. Go to your deployed function in the cloud, click "Edit" and add all environment variables in `.env.cloud`. You'll only need to do this once.
