#!/bin/bash

echo "--------- start building ---------"

go mod tidy

# Deploy the Google Cloud Function
gcloud functions deploy FUNCTION_NAME --gen2 \
 --entry-point=HelloHTTP \
 --runtime=go122 \
 --region=asia-southeast1 \
 --source=. \
 --trigger-http \
 --allow-unauthenticated \
 --env-vars-file=.env.yml \
 --project=PROJECT_ID \
 --timeout=300s

echo "--------- finish building ---------"