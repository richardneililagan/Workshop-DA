# Build and Deploy Instructions

## Compilation of the workshop lab pages

To compile the workshop use the `build.sh` script in the build directory. The build script has the following parameters and default values:
| Parameter | Description | Parameter ars | Required | Default Value |
| :------------- | :----------: | :----------: | :----------: | -----------: |
| -d | Delete the public folder before running the build | None | No | true |
| -c | Compile the CDK with NPM. Useful if you release a new module | None | No | false |
| -m | Which modules shall be compiled when -c is set to true | String of modules (e.g. "module1 module2") | No | "module1 module2" |

For a standard build all params are set for you, so you can just execute

```bash
./build.sh
```

if you want to build the CDK part for module1 use the following command

```bash
./build.sh -c -m "module1"
```

## Deployment of the workshop

The deploy script can be found in the build directory under `push.sh`. The deploy script has the following parameter:
| Parameter | Description | Parameter ars | Required | Default Value |
| :------------- | :----------: | :----------: | :----------: | -----------: |
| -b | S3 bucket name of the workshop | Name of the S3 bucket | No | workshops-staging.devax.academy |
| -a | AWS Account profile to use to upload | Profile name | No | alarter+devax-workshops1-admin |
| -w | Name of the workshop to deploy | Workshop name | No | monoliths-to-microservices |
| -p | Production deploy mode, it will switch the bucket to production | None | No | false |
| -s | Staging deploy mode, it will switch the bucket to staging | None | No | true |
| -i | Specifies if the cache shall get invalidated | None | No | true |
| -d | Specifies the distribution id, this will be automatically set to production or staging depending of which mode you're running in. You can use this to overwrite the distribution id | None | No | staging or production distribution id |

For a standard staging deploy just execute the following command:

```bash
./push.sh
```

If you want to deploy to production you can just add the production switch:

```bash
./push.sh -p
```

For other deployments or different buckets, please refer to the table above.
