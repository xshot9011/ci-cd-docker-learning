This project was bootstrapped with [Create React App](https://github.com/facebook/create-react-app).

## Available Scripts

In the project directory, you can run:

### `npm start`

Runs the app in the development mode.<br />
Open [http://localhost:3000](http://localhost:3000) to view it in the browser.

The page will reload if you make edits.<br />
You will also see any lint errors in the console.

### `npm test`

Launches the test runner in the interactive watch mode.<br />
See the section about [running tests](https://facebook.github.io/create-react-app/docs/running-tests) for more information.

### `npm run build`

Builds the app for production to the `build` folder.<br />
It correctly bundles React in production mode and optimizes the build for the best performance.

The build is minified and the filenames include the hashes.<br />
Your app is ready to be deployed!

See the section about [deployment](https://facebook.github.io/create-react-app/docs/deployment) for more information.

### `npm run eject`

**Note: this is a one-way operation. Once you `eject`, you can’t go back!**

If you aren’t satisfied with the build tool and configuration choices, you can `eject` at any time. This command will remove the single build dependency from your project.

Instead, it will copy all the configuration files and the transitive dependencies (webpack, Babel, ESLint, etc) right into your project so you have full control over them. All of the commands except `eject` will still work, but they will point to the copied scripts so you can tweak them. At this point you’re on your own.

You don’t have to ever use `eject`. The curated feature set is suitable for small and middle deployments, and you shouldn’t feel obligated to use this feature. However we understand that this tool wouldn’t be useful if you couldn’t customize it when you are ready for it.

## Learn More

You can learn more in the [Create React App documentation](https://facebook.github.io/create-react-app/docs/getting-started).

To learn React, check out the [React documentation](https://reactjs.org/).

### Code Splitting

This section has moved here: https://facebook.github.io/create-react-app/docs/code-splitting

### Analyzing the Bundle Size

This section has moved here: https://facebook.github.io/create-react-app/docs/analyzing-the-bundle-size

### Making a Progressive Web App

This section has moved here: https://facebook.github.io/create-react-app/docs/making-a-progressive-web-app

### Advanced Configuration

This section has moved here: https://facebook.github.io/create-react-app/docs/advanced-configuration

### Deployment

This section has moved here: https://facebook.github.io/create-react-app/docs/deployment

### `npm run build` fails to minify

This section has moved here: https://facebook.github.io/create-react-app/docs/troubleshooting#npm-run-build-fails-to-minify

## about ci/cd

using tarvis-ci (for testing) and deploy aws

go to travis-ci >> activate the repo that you want to do ci/cd

when we push something to git, travis will pull it down and do something following .travis.yml file

### travis.yml

contain: command to tell travis what we want to do

step:
1. tell travis we need a copy of docker running
>> services: 
2. build our image using Dockerfile.dev
>> before_install:
3. tell travis how to run our test suite
>> script:
>>>> each command need to exist after running
4. tell travis how to deploy our code to some server(aws)
>> deploy
>>>> provider: deploy to handfull deployer (host provider)
>>>> region: place where you run
>>>> app: specific the name
>>>> env: env of aws application when we create it
>>>> bucket_name: our zip file(file in github, travis auto zip it and put it in this bucket()) 
        looking for example in s3 service of aws
>>>> bucket_path: appname >> as root folder's name
>>>> on: when the branch "name" was pushed code by me, that the time to deploy

find service name "IAM",  service that use to manage api key
select users > click add user > fill info, select programmatic access > select attach  existing policies directly
(what user can do) > filter policies with elasticbeanstalk, description is provide full access... choose this one >
next > create user

note: secret key only show once in it life time ! onyly once

note: in travis.yml we won't put the secret key on it, because of privacy (public repo)

we will use environment secret, provided by travis-ci
go setting >> enviroment var >> 
note: dont show it on build log
{
        AWS_ACCESS_KEY: [key in aws],
        AWS_SECRET_KEY: [secrete key in travis ci]
}

>>>> access_key_id: $env_vaar ex. $AWS_ACCESS_KEY
>>>> secret_access_key: secure: "$env var" ex "$AWS_SECRET_KEY"

now something that I forget is port mapping because traffic outside the container cannot go through container 

so config it in dockerfile again