FROM google/dart:2.9

COPY entrypoint.sh /entrypoint.sh
COPY . /github/action_files/

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]