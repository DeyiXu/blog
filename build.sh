#!/bin/bash
# 生成静态文件。
hexo generate
# 部署网站。
hexo deploy

cp CNAME ./.deploy_git