# api-starter

Starter to develop and deploy APIs via Google Cloud Functions

## Development

Make sure to specify a `CLOUD_PROJECT` in `.env`. `CLOUD_PROJECT` should be the name of an existing Google Cloud project.

### Run locally

```bash
# load environment variables from .env and .env.cloud
export $(cat .env | xargs)

# install and launch
npm install
npm run watch
```

Go to `http://localhost:8080/` to interact with your API. Your code lives in `index.js`. (The site will be reloaded whenever `*.js` files change.)

### Deploy (via Google Cloud Functions)

Connect to your Cloud project:

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
