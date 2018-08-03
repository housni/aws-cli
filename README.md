# AWS CLI

Docker image to run AWS CLI commands without having to install it on the host system.

## Usage
Make a copy of the environment file.
```
$ cp env.sample env.dev # You can make it `env.prod` or anything you want.
```

Edit to add your own AWS credentials.
```
$ vim env.dev
```

Build your Docker image:
```
$ docker build \
    --rm \
    -t aws_cli \
    .
```

Run the `aws_cli_container` container off the `aws_cli` image, loading environment variables from the file `env.dev` into the container and specify your AWS command at the end:
```
$ docker run \
    --rm \
    -it \
    --name=aws_cli_container \
    -v ${PWD}:/app \
    --env-file ./env.dev \
    aws_cli \
    iam get-user
```

You can also create an alias for the Docker run command in your ~/.bashrc by adding this at the end:
```
alias aws='docker run --rm -it --name=aws_cli_container -v ${PWD}:/app --env-file ./env.dev aws_cli'

```

Then, source the file:
```
$ . ~/.bashrc
```

Then, you can just do:
```
$ aws iam get-user
```