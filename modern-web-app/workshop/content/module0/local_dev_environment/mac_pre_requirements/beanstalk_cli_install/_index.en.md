+++
title = "Install BeanStalk CLI"
weight = 5
pre = "<b>1.5 </b>"
+++

Install the following if not already installed on your MAC
```bash
brew install zlib openssl readline

#OUTPUT
For compilers to find zlib you may need to set:
  export LDFLAGS="-L/usr/local/homebrew/opt/zlib/lib"
  export CPPFLAGS="-I/usr/local/homebrew/opt/zlib/include"

For pkg-config to find zlib you may need to set:
  export PKG_CONFIG_PATH="/usr/local/homebrew/opt/zlib/lib/pkgconfig"
```

Add the export flags into your path as below: 
```bash
export LDFLAGS="-L/usr/local/homebrew/opt/zlib/lib"
export CPPFLAGS="-I/usr/local/homebrew/opt/zlib/include"
```

Download the git repo for beanstalk cli
```bash
git clone https://github.com/aws/aws-elastic-beanstalk-cli-setup.git
cd aws-elastic-beanstalk-cli-setup/scripts
./bundled_installer

#OUTPUT
***************
1. Finishing up
***************
Success!

    Note: To complete installation, ensure `eb` is in PATH. You can ensure this by executing:

    1. Bash:

       echo 'export PATH="/Users/USER/.ebcli-virtual-env/executables:$PATH"' >> ~/.bash_profile && source ~/.bash_profile

    2. Zsh:

       echo 'export PATH="/Users/USER/.ebcli-virtual-env/executables:$PATH"' >> ~/.zshenv && source ~/.zshenv

   
    - NOTE: To complete installation, ensure `python` is in PATH. You can ensure this by executing:
   
      1. Bash:
   
         echo 'export PATH=/Users/USER/.pyenv/versions/3.7.2/bin:$PATH' >> /Users/USER/.bash_profile && source /Users/USER/.bash_profile
   
      2. Zsh:
   
         echo 'export PATH=/Users/USER/.pyenv/versions/3.7.2/bin:$PATH' >> /Users/USER/.zshrc && source /Users/USER/.zshrc
```

#### An alternative to install is via PIP directly: 
[PIP EB Install link](!https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/eb-cli3-install.html)

``` bash
pip install awsebcli --upgrade --user
```
Add the path to the executable file to your PATH variable in your shell home - e.g. add to ~/.bash_rc 
```
export PATH=$PATH:~/Library/Python/3.7/bin
```

#### EB INIT
eb init
8 - ap-southeast-2
add in a name - travelbuddy
11 - tomcat
1 - 8.5 with java 8
n

This will create a file as below in .elasticbeanstalk/config.yaml
branch-defaults:
  default:
    environment: null
    group_suffix: null
global:
  application_name: travelbuddy
  branch: null
  default_ec2_keyname: null
  default_platform: Tomcat 8.5 with Java 8 running on 64bit Amazon Linux
  default_region: ap-southeast-2
  include_git_submodules: true
  instance_profile: null
  platform_name: null
  platform_version: null
  profile: null
  repository: null
  sc: null
  workspace_type: Application
