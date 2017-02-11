# ruby2_on_wheezy

## Dowload local dependencies

### rbenv

```bash
$ git clone https://github.com/rbenv/rbenv rbenv
$ git clone https://github.com/rbenv/ruby-build ruby-build
```

### Ruby

```bash
$ wget https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.3.tar.bz2#882e6146ed26c6e78c02342835f5d46b86de95f0dc4e16543294bc656594cc5b
$ wget https://www.openssl.org/source/openssl-1.0.2k.tar.gz#6b3977c61f2aedf0f96367dcfb5c6e578cf37e7b8d913b4ecb6643c3cb88d8c0
```

### Bundler

```bash
$ wget https://www.openssl.org/source/openssl-1.0.2k.tar.gz#6b3977c61f2aedf0f96367dcfb5c6e578cf37e7b8d913b4ecb6643c3cb88d8c0
```

## Docker

### Build image

```bash
$ sudo docker build -t rbenv .
```

### Debug image

```bash
$ sudo docker run --rm -it --network none rbenv
```

### Tools

```bash
# removes stopped containers
$ sudo docker ps -f status=exited --format="{{.ID}}" | xargs sudo docker rm
# removes unused images
$ sudo docker images --filter dangling=true --format="{{.ID}}" | xargs sudo docker rmi
```
