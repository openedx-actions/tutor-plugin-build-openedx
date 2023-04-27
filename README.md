<img src="https://avatars.githubusercontent.com/u/40179672" width="75">

[![hack.d Lawrence McDaniel](https://img.shields.io/badge/hack.d-Lawrence%20McDaniel-orange.svg)](https://lawrencemcdaniel.com)
[![discuss.overhang.io](https://img.shields.io/static/v1?logo=discourse&label=Forums&style=flat-square&color=ff0080&message=discuss.overhang.io)](https://discuss.overhang.io)
[![docs.tutor.overhang.io](https://img.shields.io/static/v1?logo=readthedocs&label=Documentation&style=flat-square&color=blue&message=docs.tutor.overhang.io)](https://docs.tutor.overhang.io)<br/>
[![AWS](https://img.shields.io/badge/AWS-%23FF9900.svg?style=for-the-badge&logo=amazon-aws&logoColor=white)](https://aws.amazon.com/)
[![Docker](https://img.shields.io/badge/docker-%230db7ed.svg?style=for-the-badge&logo=docker&logoColor=white)](https://www.docker.com/)
[![Kubernetes](https://img.shields.io/badge/kubernetes-%23326ce5.svg?style=for-the-badge&logo=kubernetes&logoColor=white)](https://kubernetes.io/)

# tutor-plugin-build-openedx

Github Action that uses Tutor to build a Docker image for openedx, and uploads to an AWS Elastic Container Registry repository.

This action was originally created to work seamlessly with AWS EKS Kubernetes and ECR resources created by the Terraform modules contained in [Cookiecutter Tutor Open edX Production Devops Tools](https://github.com/lpm0073/cookiecutter-openedx-devops) but it should also work with your own custom workflows.


## About the openedx image

This is a production-ready image of the Open edX learning management system, substantially consisting of the repository [https://github.com/openedx/edx-platform](https://github.com/openedx/edx-platform).

## Usage:


```yaml
name: Example workflow

on: workflow_dispatch

jobs:
  build:
    runs-on: ubuntu-latest

    steps:
      # required antecedent
      - uses: actions/checkout@v3.5.0

      # required antecedent
      - name: Configure AWS credentials
        uses: aws-actions/configure-aws-credentials@v2
        with:
          aws-access-key-id: ${{ secrets.THE_NAME_OF_YOUR_AWS_ACCESS_KEY_ID }}
          aws-secret-access-key: ${{ secrets.THE_NAME_OF_YOUR_AWS_SECRET_ACCESS_KEY }}
          aws-region: us-east-2

      # install and configure tutor and kubectl
      - name: Configure Github workflow environment
        uses: openedx-actions/tutor-k8s-init@v1.0.8

      # This action.
      # Note:
      # aws-ecr-repo is optional. The default value is openedx
      - name: Build the image and upload to AWS ECR
        uses: openedx-actions/tutor-plugin-build-openedx@v1.0.0
        with:
          aws-ecr-repo: openedx
```

```yaml
name: Example workflow

on: workflow_dispatch

jobs:
  build:
    runs-on: ubuntu-latest

    steps:
      # required antecedent
      - uses: actions/checkout@v3.5.0

      # required antecedent
      - name: Configure AWS credentials
        uses: aws-actions/configure-aws-credentials@v2
        with:
          aws-access-key-id: ${{ secrets.THE_NAME_OF_YOUR_AWS_ACCESS_KEY_ID }}
          aws-secret-access-key: ${{ secrets.THE_NAME_OF_YOUR_AWS_SECRET_ACCESS_KEY }}
          aws-region: us-east-2

      # install and configure tutor and kubectl
      - name: Configure Github workflow environment
        uses: openedx-actions/tutor-k8s-init@v1.0.8

      # This action.
      # Note:
      # aws-ecr-repository is optional. The default value is openedx
      # openedx-repository is optional. The default value is ''
      # openedx-version is optional. The default value is ''
      - name: Build the image and upload to AWS ECR
        uses: openedx-actions/tutor-plugin-build-openedx@v1.0.1
        with:
          aws-ecr-repository: openedx
          openedx-repository: https://github.com/openedx/edx-platform.git
          openedx-version: master #in this case the main branch is specified. You may also specify a tag
```
