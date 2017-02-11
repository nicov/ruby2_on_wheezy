FROM debian:7

# Suggested build environment for ruby-build
RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    autoconf \
    bison \
    build-essential \
    libssl-dev \
    libyaml-dev \
    libreadline6-dev \
    zlib1g-dev \
    libncurses5-dev \
    libffi-dev \
    libgdbm3 \
    libgdbm-dev \
  && rm -rf /var/lib/apt/lists/*

ENV HOME /root
ENV SHELL /bin/bash

# Install rbenv and ruby-build
ADD rbenv $HOME/.rbenv
ADD ruby-build $HOME/.rbenv/plugins/ruby-build
RUN echo 'eval "$(rbenv init -)"' >> $HOME/.profile
RUN echo 'eval "$(rbenv init -)"' >> $HOME/.bashrc
ENV PATH $HOME/.rbenv/bin:$HOME/.rbenv/shims:$PATH

# Install ruby
ENV RUBY_BUILD_CACHE_PATH $HOME/src
ADD src $RUBY_BUILD_CACHE_PATH
RUN rbenv install 2.3.3 \
  && rbenv global 2.3.3

# Install bundler
ADD gems $HOME/gems
RUN gem install --no-rdoc --no-ri $HOME/gems/bundler-1.14.3.gem

CMD ["/bin/bash"]

#RUN git clone https://github.com/rbenv/rbenv.git ~/.rbenv \
#  && echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc \
#  && echo 'eval "$(rbenv init -)"' >> ~/.bashrc
