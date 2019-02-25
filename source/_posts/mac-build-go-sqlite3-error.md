---
title: Mac交叉编译linux go-sqlite3错误
date: 2019-02-25 17:12:05
tags:
---

# 交叉编译配置
```bash
export CGO_ENABLED=1
export GOOS=linux
export GOARCH=amd64
go build -o ./bin/example ./cmd/
```
# 错误详情
```bash
sqlite3-binding.c:32753:42: error: use of undeclared identifier 'pread64'
sqlite3-binding.c:32771:42: error: use of undeclared identifier 'pwrite64'
sqlite3-binding.c:32903:22: error: invalid application of 'sizeof' to an incomplete type 'struct unix_syscall []'
sqlite3-binding.c:32912:22: error: invalid application of 'sizeof' to an incomplete type 'struct unix_syscall []'
sqlite3-binding.c:32939:20: error: invalid application of 'sizeof' to an incomplete type 'struct unix_syscall []'
sqlite3-binding.c:32956:16: error: invalid application of 'sizeof' to an incomplete type 'struct unix_syscall []'
sqlite3-binding.c:14066:38: note: expanded from macro 'ArraySize'
sqlite3-binding.c:32960:14: error: invalid application of 'sizeof' to an incomplete type 'struct unix_syscall []'
sqlite3-binding.c:14066:38: note: expanded from macro 'ArraySize'
sqlite3-binding.c:35613:11: warning: type specifier missing, defaults to 'int' [-Wimplicit-int]
sqlite3-binding.c:32757:49: note: expanded from macro 'osPread64'
sqlite3-binding.c:35725:17: warning: type specifier missing, defaults to 'int' [-Wimplicit-int]
sqlite3-binding.c:32775:57: note: expanded from macro 'osPwrite64'
```

# 问题
Mac未安装`linux的交叉编译器`。解决方法，安装`linux的交叉编译器`

# 下载地址
[Compiling for Linux 32 and Linux 64 on MacOS X](http://crossgcc.rts-software.org/doku.php?id=compiling_for_linux)

# 修改交叉编译配置
```bash
export CGO_ENABLED=1
export GOOS=linux
export GOARCH=amd64
export CC=/usr/local/gcc-4.8.1-for-linux64/bin/x86_64-pc-linux-gcc
go build -o ./bin/example ./cmd/
```