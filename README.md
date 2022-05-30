<img src="https://avatars.githubusercontent.com/u/40179672" width="75">

[![hack.d Lawrence McDaniel](https://img.shields.io/badge/hack.d-Lawrence%20McDaniel-orange.svg)](https://lawrencemcdaniel.com)
[![discuss.overhang.io](https://img.shields.io/static/v1?logo=discourse&label=Forums&style=flat-square&color=ff0080&message=discuss.overhang.io)](https://discuss.overhang.io)
[![docs.tutor.overhang.io](https://img.shields.io/static/v1?logo=readthedocs&label=Documentation&style=flat-square&color=blue&message=docs.tutor.overhang.io)](https://docs.tutor.overhang.io)

[![AWS](https://img.shields.io/badge/AWS-%23FF9900.svg?style=for-the-badge&logo=amazon-aws&logoColor=white)](https://aws.amazon.com/)
[![Docker](https://img.shields.io/badge/docker-%230db7ed.svg?style=for-the-badge&logo=docker&logoColor=white)](https://www.docker.com/)
[![Kubernetes](https://img.shields.io/badge/kubernetes-%23326ce5.svg?style=for-the-badge&logo=kubernetes&logoColor=white)](https://kubernetes.io/)

# tutor-plugin-build-openedx

Github Action that uses Tutor to build a Docker image for openedx, and uploads to an AWS Elastic Container Registry repository.

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
      - uses: actions/checkout@v3.0.2

      # required antecedent
      - name: Configure AWS credentials
        uses: aws-actions/configure-aws-credentials@v1.6.1
        with:
          aws-access-key-id: ${{ secrets.THE_NAME_OF_YOUR_AWS_ACCESS_KEY_ID }}
          aws-secret-access-key: ${{ secrets.THE_NAME_OF_YOUR_AWS_SECRET_ACCESS_KEY }}
          aws-region: us-east-2

      # This action.
      # Note that aws-ecr-repo is optional. The default value is openedx
      - name: Build the image and upload to AWS ECR
        uses: openedx-actions/tutor-plugin-build-openedx
        with:
          aws-ecr-repo: openedx
          custom-theme-repository: 'lpm0073/edx.custom-theme'
          custom-theme-repository-ref: 'master'
          custom-plugin-repository: 'openedx-plugin-example'
          custom-plugin-repository-organization: lpm0073
          custom-plugin-repository-ref: 'main'
          custom-xblock-repository: 'edx-ora2'
          custom-xblock-repository-organization: 'openedx'
          custom-xblock-repository-ref: 'master'
```
