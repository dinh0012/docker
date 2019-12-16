#ci

### initialize

command
```
    % git clone git@github.com:tomoyamachi/php-ci.git
    % cd php-ci/bin
    % ./initialize.sh
    % cd ../../
    % mkdir project_name
    % cd project_name
    % vim Makefile
    % vim composer.json
    % make
```

Makefile
```
PROJECT_DIR=$(shell pwd)
PROJ_TOP_DIR=$(PROJECT_DIR)/../project-ci
include $(PROJ_TOP_DIR)/config/Makefile.d/var.d/*.mk
include $(PROJ_TOP_DIR)/config/Makefile.d/register.d/app.mk
include $(PROJ_TOP_DIR)/config/Makefile.d/register.d/ci.mk
include $(PROJ_TOP_DIR)/config/Makefile.d/register.d/composer.mk
include $(PROJ_TOP_DIR)/config/Makefile.d/register.d/php.mk
include $(PROJ_TOP_DIR)/config/Makefile.d/task.d/*.mk
```

composer.json (sample)
```
{
    "name": "Project Name",
    "description": "Project Description",
    "version": "0.0.1",
    "type": "project",
    "license": "proprietary",
    "autoload": {
        "psr-4": {
            "ProjectName\\": "src"
        }
    },
    "autoload-dev": {
        "psr-4": {
            "Test\\": "test"
        }
    },
    "config": {
        "bin-dir": "bin",
        "vendor-dir": "var/composer/vendor"
    }
}
```

### command

```
    % make check
```
- 下記順序で呼び出される
make php-check-syntax
make php-lint
make php-check-code
make php-test
make php-generate-doc
