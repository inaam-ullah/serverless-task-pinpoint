
## serverless-task-pinpoint

- Created a serverless task with 3rd Party APIs in ruby.

## Installation and Setup

1. **Node.js and npm:**
   Ensure you have Node.js and npm installed on your machine. You can download and install them from the [official Node.js website](https://nodejs.org/).

2. **Install Serverless Framework:**
   After installing Node.js and npm, install the Serverless Framework globally using npm:

   ```bash
   npm install -g serverless
   ```
## Create a New Serverless Project:

```bash
serverless create --template aws-ruby --path my_serverless_project
```
**Note:** Add path according to the Requirements

## Configure AWS credentials 

```bash
serverless config credentials --provider aws --key YOUR_ACCESS_KEY --secret YOUR_SECRET_KEY
```

## Deployment

If you want to deploy your function and all your credentials are set then you can simple do:

```bash
serverless deploy
```

**Note:** You can also use Sam-cli
