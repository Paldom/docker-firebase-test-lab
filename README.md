# docker-firebase-test-lab

This [repository](https://github.com/paldom/docker-firebase-test-lab) contains the Dockerfile of the [dpal/docker-firebase-test-lab](https://hub.docker.com/r/dpal/docker-firebase-test-lab/) image. With this container you can easily automate your Firebase Test Lab tests.

## Usage

### Requirements

Before running a docker image, you prepare the following:

* Find your ```credentials``` file, or create one (see below).
* Find APKs you want to test.
* Specify a folder (e.g. working directory) as docker volume and place those files into that directory.

### Pull image

#### From Docker Hub

```sh
docker pull dpal/docker-firebase-test-lab:latest
```

#### Or build from GitHub

```sh
docker build -t dpal/docker-firebase-test-lab github.com/paldom/docker-firebase-test-lab
```

### Run docker image

Here's an example how to run this docker container:

```sh
docker run -v $PWD:/firebase -e "PROJACC=YOUR_EMAIL"  -e "PROJID=YOUR_PROJECT_ID" -e "DEVICE=Nexus5" -e "OS=22" --name firebase dpal/docker-firebase-test-lab
```

### Params

You can use the following environment variables:

* **PROJACC** - your project account (e-mail address), **required**
* **PROJID** - your project id, **required**
* **CRED** - location of your credential file, defaults to: *credentials*
* **APP** - location of your APK file, defaults to: *./app/build/outputs/apk/app-debug-unaligned.apk*
* **TEST** - location of your test APK file, defaults to: *./app/build/outputs/apk/app-debug-androidTest-unaligned.apk*
* **DEVICE** - test device (or devices), defaults to: *Nexus5*
* **OS** - os version of test device (or devices), defaults to: *22*
* **LOCALE** - locale settings of test device (or devices), defaults to: *en*
* **ORIENTATION** - screen orientation of test device (or devices), defaults to: *portrait*

### Credentials

Important! You should define a ```credentials``` file in order to run ```gcloud``` tool. If you don't have a ```credentials``` file, you can create one with the following steps.

1. Run docker container on your host:

```sh
docker run --entrypoint bash -it dpal/docker-firebase-test-lab
```

2. Type the following command and follow the steps:

```sh
gcloud auth login
```

3. Your ```credentials``` file will be located at ~/.config/gcloud/credentials:

```sh
cat ~/.config/gcloud/credentials
```

4. Copy conents of ```credentials``` and save on your host.
