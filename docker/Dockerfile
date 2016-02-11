FROM turistforeningen/ruby-iojs:2.2-3.0

RUN mkdir -p /var/jekyll/src /var/jekyll/dst
ADD Gemfile /var/jekyll/Gemfile

WORKDIR /var/jekyll

RUN bundle install

CMD jekyll serve --watch --source /var/jekyll/src --destination /var/jekyll/dst --drafts
